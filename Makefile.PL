use strict;
use warnings;
use ExtUtils::MakeMaker;

my $repo = '';
my $class = '';
my $author = '';
die "SET repo and class and author" if !$repo or !$class or !$author;
(my $vfrom = $class) =~ s#::#/#g;
WriteMakefile(
  AUTHOR => $author,
  MIN_PERL_VERSION => '5.010001',
  NAME => $class,
  VERSION_FROM => "lib/$vfrom.pm",
  PREREQ_PM => {
  },
  TEST_REQUIRES => {
    'Test::More' => '0.88', # done_testing
  },
  LICENSE => 'perl',
  META_MERGE => {
    'meta-spec' => { version => 2 },
    resources => {
      dynamic_config => 0,
      bugtracker => { web => "https://github.com/$repo/issues" },
      license => 'http://dev.perl.org/licenses/',
      repository => {
        type => 'git',
        url => "https://github.com/$repo.git",
        web => "https://github.com/$repo",
      },
    },
    prereqs => {
      develop => {
        requires => {
          'Test::Pod' => '1.45',
        },
      },
    },
  },
);
