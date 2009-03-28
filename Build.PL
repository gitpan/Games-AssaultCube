# Build.PL
use strict; use warnings;
use Module::Build;

my $build = Module::Build->new(
	# look up Module::Build::API for the info!
	'dynamic_config'	=> 0,
	'module_name'		=> 'Games::AssaultCube',
	'license'		=> 'perl',

	'dist_abstract'		=> "The AssaultCube perl libraries",
	'dist_author'		=> 'Apocalypse <APOCAL@cpan.org>',

	'create_packlist'	=> 1,
	'create_makefile_pl'	=> 'traditional',
	'create_readme'		=> 1,

	'test_files'		=> 't/*.t',

	'add_to_cleanup'	=> [ 'META.yml', 'Makefile.PL', 'README', 'Makefile' ],	# automatically generated

	'build_requires'	=> {
		# for serverquery.t
		'Storable'	=> '2.18',	# force latest so it can read the data...
		'MIME::Base64'	=> 0,
	},

	'requires'		=> {
		# our Moose crap :)
		'Moose'				=> 0,
		'MooseX::StrictConstructor'	=> 0,

		# Socket stuff
		'IO::Socket'			=> 0,
		'LWP::UserAgent'		=> 0,
		'HTTP::Request'			=> 0,
		'HTTP::Response'		=> 0,

		# Needed for Log::Line
		'DateTime'			=> 0,

		# set our minimum perl version ( needed for utf8 support )
		'perl'				=> '5.008',
	},
);

# all done!
$build->create_build_script;
