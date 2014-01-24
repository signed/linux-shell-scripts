#!/usr/bin/perl
use strict;
use File::Copy;


my $dir = "/home/user/directory";
opendir DIR,$dir or die "Cannot open directory: $!";
my @dir = readdir(DIR);
close DIR;
@dir = sort(@dir);

foreach(@dir){
    my $file = $_;
    
    #printCharacterCodes($file, "prefix");
    stripIllegalCharacters($dir, $file);
}

sub printCharacterCodes
{
    my $filename = shift;
    my $prefix = shift;
    
    if($filename =~ m/^$prefix/){
        while ($filename =~ /(.)/g) { # . is never a newline here
            my $character = $1;
            my $number = ord($character);
            print "'" . $character . "' : " . $number . "\n";
        }
    }   
}

sub stripIllegalCharacters
{
    my $directory = shift;
    my $filename = shift;
    
    my %substitutions = ();
    $substitutions{"a" . chr(249)} = "ä";
    $substitutions{"u" . chr(249)} = "ü";
    $substitutions{"o" . chr(249)} = "ö";
    $substitutions{chr(225)} = "ß";

    
    my $fixed = $filename;
    
    while ((my $pattern, my $replacement) = each %substitutions){
        $fixed =~ s/$pattern/$replacement/g;  
    }
    
    
    if( $filename ne $fixed){
        my $oldpath= $directory . $filename;
        my $newpath= $directory . $fixed;
        print $oldpath . "\n";
        print $newpath . "\n";
        
        move($oldpath, $newpath) or die "move failed: $!";
    }
}