#!/usr/bin/local/perl

#use Lingua::Ispell;
use Lingua::Ispell qw( spellcheck ); # import the function
use Data::Dumper;

# ... rewriting this ugh.


#open READ, "10-million-combos.txt" or die "Whatever";

#open READ, "pw.txt" or die "no";

%pw;

open READ, "fewerstill.txt" or die;

my @words = <READ>;
close READ;
foreach my $word (@words){
	chomp $word;
	$word =~ s/\n|\n\r|\r|\ //ig;
	if (exists $pw{$word}){
		$pw{$word} += 1;
	}else{
		$pw{$word} = 1;
	}


}

#print Dumper(%pw);



open GARDEN, "garden.txt" or die "GARDEN DIED";

@garden = <GARDEN>;

foreach my $line (@garden){
	
	my @gardenwords = split(/ /, $line);


	foreach my $secret (@gardenwords){

		$secret =~ s/[\.\'\"\;\:\.\,\?\/\\0-9]//g;
		#print $secret . "\n";

		#print $pw{$secret} . "\n";

		if ($pw{$secret} > 0){
			print $secret . " ";
		}else{
			print "*" x length($secret) . " ";
		}
	}

	print "\n";
}

# foreach (sort {$pw{$a} <=> $pw{$b}} keys %pw){
# 	print "$_\t($pw{$_})\n";
# }


# foreach my $line (<READ>){
# 	chomp $line;
	

# 	$r = spellcheck($line);

# 	#print "$r\n";

# 	if ($r eq 0){
# 		print $line . "\n";
# 	}

	# if (length($r) == 0){
	# 	print "$line\n";
	# }

	# for my $r ( spellcheck($line) ){
	# 	if ($r->{'type'}){

	# 	}
	# 	#print "$r->{'type'}: $r->{'term'}\n";
	# 	if (length($r->{'type'}) > 0){
	# 		#print $r->{'term'};
	# 		print "$r->{'type'}\n";
	# 	}
	# }

	# print "$r->{'type'}: $r->{'term'}\n";

	# if ($r->{'none'}){
	# 	print "No word!\n";
	# }else{
	# 	print "Word! The word is $line\n";
	# }

	#my ($u, $p) = split(/\t/, $line);


	#print "$p\n"

	# print "u = $u, p = $p\n";
	#chomp $p;
	# $word = $p;

	# print "$p[1] -> ";

	# if ($speller->check($p)){
	#   	print "matched: $p\n";
 #    }

	  #  print $speller->check( $p );
          # ? "is $p found\n"
          # : "";

#}
