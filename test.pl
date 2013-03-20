#!/usr/bin/perl

use XML::Feed;
use Data::Dumper;
binmode STDOUT, ":utf8";

open FILE, 'feeds.txt' or die "Can't open file: $!\n";
my @urls = <FILE>;

foreach my $url (@urls) {
    print "url:".$url."\n";
    my $feed = XML::Feed->parse(URI->new($url)) or die XML::Feed->errstr;
    print $feed->title, "\n";
    for my $entry ($feed->entries) {
        print $entry->title."->".substr($entry->content->body,0,100)."\n";
    }
}
#print Dumper($entry)."\n";

