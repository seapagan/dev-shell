use strict;
use File::Basename;
use Cwd 'abs_path';

# NOTE : We need to get the base path of the system, but in TinyPerl $0 does not work so it is difficult
# to get the proper script location as the usual standard methods will fail.
# To get past this when we run this from the standard bootstrap.cmd, first we CD to the bootstrap directory.
# This allows us to run the script from its own directory directly for testing.

# Script currently messy, will be rebased once functional.

# Get our base path...
my $base_directory = abs_path();
my $root_directory = abs_path($base_directory."/../..");

# create the MSYS & MinGW directories if they do not exist...
if (!-d $root_directory."/msys") {
  mkdir $root_directory."/msys" or die "Cannot create MSYS directory!";
}
if (!-d $root_directory."/mingw32") {
  mkdir $root_directory."/mingw32" or die "Cannot create MinGW directory!";
}

# Build other useful directories from this...
my $msys_directory = abs_path($root_directory."/msys");
my $mingw_directory = abs_path($root_directory."/mingw32");
my $package_directory = abs_path($root_directory."/support/packages");
my $support_directory = abs_path($root_directory."/support");

# Cache directories to store MSYS / MinGW packages...
my $msys_cache = $package_directory."/msys";
my $mingw_cache = $package_directory."/mingw";
my $tdm_cache = $package_directory."/tdm";

# ------------------------------------------------------------------------------
# We need a few support utilities, this will also include Console and ANSICON.
print "\nStage 2 : Download assorted support utilities.\n\n";
# load the Support tools URL's into an array from the file 'msys-urls'...
my $path_to_urls = $base_directory."/urls/support-urls";
my @toolsurls = geturls($path_to_urls);

getfiles($package_directory, @toolsurls);

# ------------------------------------------------------------------------------
print "\nStage 3 : Download MSYS packages to local cache.\n\n";
# load the MSYS URL's into an array from the file 'msys-urls'...
my $path_to_urls = $base_directory."/urls/msys-urls";
my @msysurls = geturls($path_to_urls);

# create the MSYS Cache directory if it does not exist...
if (!-d $msys_cache) {
  mkdir $msys_cache or die "Cannot create Cache directory for MSYS!";
}
# get all the MSYS packages we need...
getfiles($msys_cache, @msysurls);

# ------------------------------------------------------------------------------
print "\nStage 4 : Download MinGW packages to local cache.\n\n";
# load the minGW URL's into an array from the file 'mingw-urls'...
my $path_to_urls = $base_directory."/urls/mingw-urls";
my @mingwurls = geturls($path_to_urls);

# create the MinGW Cache directory if it does not exist...
if (!-d $msys_cache) {
  mkdir $msys_cache or die "Cannot create Cache directory for MinGW!";
}
# get all the minGW packages we need...
getfiles($mingw_cache, @mingwurls);

print "\nStage 4 : Download TDM GCC Compiler packages to local cache.\n\n";
# load the GCC URL's into an array from the file 'tdm-gcc-urls'...
my $path_to_urls = $base_directory."/urls/tdm-gcc-urls";
my @gccurls = geturls($path_to_urls);

# create the MinGW Cache directory if it does not exist...
if (!-d $tdm_cache) {
  mkdir $tdm_cache or die "Cannot create Cache directory for TDM GCC!";
}
# get all the GCC packages we need...
getfiles($tdm_cache, @gccurls);

# commented out for now...
=pod
# now unpack these. We will do an unconditional over-write for all existing files, so any customisations will be overwritten.
foreach $url (@msysurls) {
  #get the actual filename, from the last part of the URL, removing the SorceForge '/download' text...
  my $filename = basename(substr($url, 0, -9));
  my $filewithpath = $msys_cache."/".$filename;
  # these come in a couple of archive types so we need to use a different utility to unpack depending on the extension
  my @exts = qw(.lzma .xz);
  my ($dir, $name, $ext) = fileparse($filename, @exts);

  for ($ext) {
    if (/lzma/) {
      #print "$filename is an LZMA file! ($ext)\n";
    }
    elsif (/xz/) {
      #print "$filename is an XZ file! ($ext)\n";
    }
  }
}
=cut


# ------------------------------------------------------------------------------
# support functions

sub geturls() {
  # when provided with a file containing URLS, will return an array containing them.
  # 1 parameter - $path_to_urls, filepath to text file containing the URL's
  my ($path_to_urls) = @_;

  open my $handle, '<', $path_to_urls or die "Cant open $path_to_urls";
  chomp(my @urls = <$handle>);
  close $handle;
  # Return the array of URLs ...
  return @urls;
}

sub getfiles() {
  # will take an array of URL's and a destination folder and proceed to download them all using wget...
  # Parameter 1 : $dest_dir, directory to store them in.
  # Parameter 2 : @url_list, an array of URL's
  # ERROR CHECKING STILL TO BE ADDED!
  my ($dest_dir, @url_list) = @_;

  foreach my $url (@url_list) {
    # get the actual filename from the last part of the URL, removing the SorceForge '/download' text if it exists ...
    # we also need a different flag for sorceforge, which would probably confuse other sites (certainly github anyway)

    # pre-define the variables otherwise not valid outside the if statement..
    my $filename="";
    my $dl_flag ="";

    # Trim spaces from start and end of URL...
    $url =~  s/^\s+|\s+$//g;
    # break out if $url is blank...
    if ($url eq "") {
      next;
    }

    # different wget flags depending on source of package, also remove '/download' from end or SourceForge URL.
    if ( $url =~ /\/download$/) {
      $filename = basename(substr($url, 0, -9));
      $dl_flag= "--trust-server-names";
    } else {
      $filename = basename($url);
      $dl_flag= "--no-check-certificate";
    }

    my $filewithpath = $dest_dir."/".$filename;
    #if this does not exist in cache then we will download. In future versions we will compare to a checksum too...
    if (-e $filewithpath) {
      print "$filename already exists, skipping.\n";
    } else {
      my $result = `$base_directory/wget -q --show-progress -c $dl_flag --directory-prefix=$dest_dir $url`;
    }
  }
}
