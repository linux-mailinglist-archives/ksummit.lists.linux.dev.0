Return-Path: <ksummit+bounces-2245-lists=lfdr.de@lists.linux.dev>
X-Original-To: lists@lfdr.de
Delivered-To: lists@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 18FD1B3D9B4
	for <lists@lfdr.de>; Mon,  1 Sep 2025 08:17:37 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 6CD4C188A7E4
	for <lists@lfdr.de>; Mon,  1 Sep 2025 06:17:57 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 26D5C243387;
	Mon,  1 Sep 2025 06:17:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=infradead.org header.i=@infradead.org header.b="I5nynCRR"
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 20278140E34;
	Mon,  1 Sep 2025 06:17:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.137.202.133
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1756707449; cv=none; b=H9cyQBEuiPFplGUeFhhK3qVHmnAXsejSAaCupon1a4LXQpdZ6lylp03y2Vzl4cdl6i6mgU4Wv1mPfwL9CuJg/WTZ1R6J8trzwPTRSqkvo0ABHOghLHpbMw/om5Ho8kgW+XtBMks9v5nyca2wV/IvkS4LcntvmsbwjW/FaPmzKWE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1756707449; c=relaxed/simple;
	bh=rUiNyoo0LeUbHh3MBayv1rMpjGBYOZOWHdYL7yj3ZLA=;
	h=Content-Type:Message-ID:Date:MIME-Version:Subject:To:Cc:
	 References:From:In-Reply-To; b=UeEDAltt+BKC/fKwj8RQR4QRDVpWxAfHhhTukFK4gysEJ0zogLqAku+LQLX78pVSL7XkF85YU4BPfKbCvVOYdKO4Z0/ZPfnedl3Z5H4v7sysTbnpD6PYzaZBN6VttxvEEbwU0Bgs68naC5heLw20ZHqUnAeKtL8sHuSo3oPAtH0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=infradead.org; spf=none smtp.mailfrom=infradead.org; dkim=pass (2048-bit key) header.d=infradead.org header.i=@infradead.org header.b=I5nynCRR; arc=none smtp.client-ip=198.137.202.133
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=infradead.org
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=bombadil.20210309; h=In-Reply-To:From:References:Cc:To:
	Subject:MIME-Version:Date:Message-ID:Content-Type:Sender:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description;
	bh=ctukEWWRJULzaVojoze8pUFplWpkj9qsPzEqEpe0PFE=; b=I5nynCRRn/HHncM+cDXMb+kLJf
	fK1pnfPLuv66qCHTBBbiTGV2GHoOYnTaJflOWRcQ5ftfXPKpiPDQ5Pw6dIekySghD6WzsTpYzb2HK
	eB330Y8EWKNZkM67mLfJEkKu5QFCOp7tccRL4BkbfR+sgJHEl0xW6/OZfhQFp3u5dju9F/tiY0zpN
	avW7sWxH6uGOPPu6rVrQ2DYvLryMQyoP1dxCHqoFBeF/A2+TyEa7MQw6hbCENtHcaoInbsyn7QF4a
	jibQaCHvirRWmTJr+5rEV3UgQH4+/kMsrC+gfcsz+VggGEX/AtJb+ISg76v4czFNo8HCgne+2hlVA
	3XT2T4Og==;
Received: from [50.53.25.54] (helo=[192.168.254.17])
	by bombadil.infradead.org with esmtpsa (Exim 4.98.2 #2 (Red Hat Linux))
	id 1usxr1-0000000BJ5K-2dKm;
	Mon, 01 Sep 2025 06:17:23 +0000
Content-Type: multipart/mixed; boundary="------------WTZTRdUPp0NqvjYNs0rco7TN"
Message-ID: <636fe6e8-dc66-4521-a64a-4fb972e7ef39@infradead.org>
Date: Sun, 31 Aug 2025 23:17:22 -0700
Precedence: bulk
X-Mailing-List: ksummit@lists.linux.dev
List-Id: <ksummit.lists.linux.dev>
List-Subscribe: <mailto:ksummit+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:ksummit+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [TECH TOPIC] Kernel documentation - update and future directions
To: Jonathan Corbet <corbet@lwn.net>,
 Mauro Carvalho Chehab <mchehab+huawei@kernel.org>
Cc: Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
 Vegard Nossum <vegard.nossum@oracle.com>, ksummit@lists.linux.dev,
 Linux Documentation <linux-doc@vger.kernel.org>,
 Mauro Carvalho Chehab <mchehab@kernel.org>, Akira Yokosawa
 <akiyks@gmail.com>, Bagas Sanjaya <bagasdotme@gmail.com>,
 Jani Nikula <jani.nikula@intel.com>, Matthew Wilcox <willy@infradead.org>
References: <87plcndkzs.fsf@trenco.lwn.net>
 <20250828230104.GB26612@pendragon.ideasonboard.com>
 <87wm6l0w2y.fsf@trenco.lwn.net>
 <930d1b37-a588-43db-9867-4e1a58072601@oracle.com>
 <20250830222351.GA1705@pendragon.ideasonboard.com>
 <87h5xo1k6y.fsf@trenco.lwn.net> <20250831160339.2c45506c@foz.lan>
 <87zfbfz1px.fsf@trenco.lwn.net>
Content-Language: en-US
From: Randy Dunlap <rdunlap@infradead.org>
In-Reply-To: <87zfbfz1px.fsf@trenco.lwn.net>

This is a multi-part message in MIME format.
--------------WTZTRdUPp0NqvjYNs0rco7TN
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit



On 8/31/25 1:16 PM, Jonathan Corbet wrote:
> Mauro Carvalho Chehab <mchehab+huawei@kernel.org> writes:
> 
>> 4) kernel-doc kAPI
>>
>> It shouldn't be that hard to do the same for kernel-doc kAPI documentation:
>> kernel-doc now can parse the entire tree with:
>>
>> 	$ scripts/kernel-doc .
>>
>> Someone can easily use it to discover the current gaps at the docs that
>> have already some kernel-doc markups and identify what of them aren't
>> yet placed under Documentation/ ".. kernel-doc::" markups.

Mauro, I tried that for one file: kernel/audit.c
but didn't see what I expected to see.
What options should I be using to find the gaps?

> ...or one can use scripts/find-unused-docs.sh, which was written for
> just this purpose :)

Yes, and I have used this script. It does what it was meant to do AFAIK.
It's reporting is at a gross file level.

I made a small subdirectory called "test" and copied kernel/audit.c to test/.

$ ./scripts/find-unused-docs.sh  test/
The following files contain kerneldoc comments for exported functions that are not used in the formatted documentation
test/audit.c

Sometime in the last 2-3 years Matthew Wilcox asked me about a tool (script, whatever)that would detect both EXPORTs without kernel-doc and kernel-doc without EXPORTs.
Either one of these can be noisy (with false positives) and they often don't lend
themselves to easy/beginner fixes.

Anyway, after some delay, I have such a script. It's written in Perl (I started
on it over a year ago!). It might have been desirable to add it to scripts/kernel-doc.pl
at the time, but it didn't seem to me like a good fit there, so it's independent.

Running (no options, just produce a summary)
$ kerndoc-export-search.pl test/audit.c
reports:
Missing kernel-doc for: audit_log_task_info
Missing kernel-doc for: audit_enabled
Missing kernel-doc for: audit_log_task_context
3 missing kernel-docs
Missing EXPORT for: audit_serial
Missing EXPORT for: audit_log_untrustedstring
Missing EXPORT for: audit_log_n_untrustedstring
Missing EXPORT for: audit_log_n_hex
Missing EXPORT for: audit_log_lost
Missing EXPORT for: audit_set_loginuid
Missing EXPORT for: auditd_test_task
Missing EXPORT for: audit_ctl_lock
Missing EXPORT for: audit_string_contains_control
Missing EXPORT for: audit_signal_info
Missing EXPORT for: audit_log_path_denied
Missing EXPORT for: audit_ctl_unlock
12 missing Exports

If that's not verbose enough (!), the -l (list) option lists each function's
location and short description. One example:
test/audit.c: 2006: audit_log_format:  * audit_log_format - format a message into the audit buffer.

But that generates lots of output.

And of course, for function, I mean function/struct/union/enum/typedef.

There is a "verbose" option but it currently does not print anything.

Here is a help summary:
$ kerndoc-export-search.pl -h
kerndoc-export-search.pl [--list|-l] [--verbose|-v] file(s)
  where --list    prints filename:line:funcname: short_description
  where --verbose prints more info.
  default: prints a doc/export summary + warnings.
  version: 0.9


Feel free to use in any way or to rewrite & merge it into the
kdoc python system.

FWIW.
-- 
~Randy

--------------WTZTRdUPp0NqvjYNs0rco7TN
Content-Type: application/x-perl; name="kerndoc-export-search.pl"
Content-Disposition: attachment; filename="kerndoc-export-search.pl"
Content-Transfer-Encoding: 7bit

#! /usr/bin/perl
# kerndoc-export-search.pl
#
# summarize (default) or list kernel-doc short description lines from source file(s);
# Summary reports kernel-doc warnings, missing kernel-doc for EXPORTs,
#    and missing EXPORTs where kernel-doc notation was found;
# Randy Dunlap <rdunlap@infradead.org>
# 2007-04-11, 2021-06-02, 2024-12-12, 2025-08-31
# License is GPL-v2.0.
#
# TO ADD:
# 1. maybe add line# to kernel-doc and EXPORT saved locations so that they can
#    be output in line# order instead of whatever order Perl decides;
# 2. read_proto() endings are a problem with typedef + type/etc; TBD;
# 3. check/ignore?: exported typedef/enum/struct/union (definitions, not decls)


use File::Basename;

my $VER = "0.9";
my $warn_count;			# count warnings
my $opt_list = 0;
my $opt_verbose = 0;
my $opt_debug = 0;

my %funcnames = ();
my %funcflags = ();
my %exports = ();

my $export_symbol     =    '^\s*EXPORT_SYMBOL(_GPL)?\s*\(\s*(\w+)\s*\)\s*;';
my $export_symbol_ns1 = '^\s*EXPORT_SYMBOL_NS(_GPL)?\s*\(\s*(\w+)\s*,\s*\S+\)\s*;';
my $export_symbol_ns2 = '^\s*EXPORT_SYMBOL_NS(_GPL)?\s*\(\s*(\w+)\s*,\s*"\S+"\)\s*;';
my $export_symbol_nsx = '^\s*EXPORT_SYMBOL_NS(_GPL)?\s*\(\s*(\w+)\s*,.*\)\s*;';

# bit flags for %funcflags
use constant {
	FF_NONE		=> 0,		# none set; also indicates "function"
	FF_STATIC	=> 1,		# "static" func
	FF_INLINE	=> 2,		# "inline" func
# so a static inline or inline static function has funcflags == 3
	FF_ENUM		=> 4,
	FF_TYPEDEF	=> 8,
	FF_STRUCT	=> 16,
	FF_UNION	=> 32,
	FF_NONFUNC	=> 60,		# sum of ENUM/TYPEDEF/STRUCT/UNION
	FF_DEF_OBJ	=> 64,		# no immediate '('
	FF_DEF_FUNC	=> 128,		# immediate '('
	FF_SYSCALL	=> 256,		# system call
};

sub usage() {
	my $name = basename($0);

	print STDERR "$name [--list|-l] [--verbose|-v] file(s)\n";
	print STDERR "  where --list    prints filename:line:funcname: short_description\n";
	print STDERR "  where --verbose prints more info.\n";
	print STDERR "  default: prints a doc/export summary + warnings.\n";
	print STDERR "  version: $VER\n";
	exit 1;
}

sub warning($$$) {
	my $fl = shift;
	my $ln = shift;
	my $msg = shift;

	print "warning: $fl: $ln: $msg\n";
	++$warn_count;
}

sub read_discard_desc() {
	my $desc;

DESC:
	while ($desc = <FILE>) {
		last if $desc =~ '\*/';
	}
}

sub verbose($) {
	my $str = shift;
	print "$str" if $opt_verbose;
}

sub dbgit($) {
	my $str = shift;
	print "$str" if $opt_debug;
}

sub find_type($) {
	my $dsc = shift;

	dbgit("#find_type# for |$dsc|\n");
	return "typedef" if $dsc =~ '\*\s+typedef';
	return "enum"    if $dsc =~ '\*\s+enum';
	return "struct"  if $dsc =~ '\*\s+struct';
	return "union"   if $dsc =~ '\*\s+union';
	return "define"  if $dsc =~ '\*\s+define';
	return "func";
}

# read entire protytype for a function or
# read the entire enum/typedef/struct/union/define declaration
# (Does not currently support a combination decl/definition.)
#
# If the first line of the prototype begins with /#\s*define/
# then read the entire prototype for the macro, honoring "\\"
# continuation lines.
#
sub read_proto($) {
	# skip any leading blank lines
	# then read/save up thru '{' for func or ';' for other desctypes
	# or for a define, thru a line that does not end with '\'

	my $desctype = shift;
	my $prot = "";
	my $ln;
	my $lncount = 0;
	my $ending;	# ending char(s) for func/enum/typedef/struct/union

	#$ending = $desctype eq "func" ? "}" : ";";
	$ending = $desctype eq "func" ? "{" : ";";
	if ($desctype eq "struct" || $desctype eq "union" ||
	    $desctype eq "enum") {
	    	#$ending = "}\s*;"
	    	$ending = "{";
	}
	if ($desctype eq "typedef") { ### TBD
		#$ending = depends on struct?, union?, func?, enum?;
	}

	my $macro = $desctype eq "define";
	dbgit("#read_proto.40# desctype=$desctype, macro=$macro, ending=$ending\n");

PROT:
	while ($ln = <FILE>) {
		chomp $ln;
		next PROT if $ln eq "";

		++$lncount;
		if ($lncount == 1 && $ln =~ /#\s*define/) {
			$macro = 1;
			dbgit("#read_proto.42# switch to macro=$macro\n");
		}

		if ($macro) {
			if (substr($ln, -1) eq "\\") {
				substr($ln, -1, 1) = " ";
				$prot = $prot . " " . $ln;
				dbgit("#read_proto.44# macro prot now=$prot\n");
				next PROT;
			}
			else {
				$prot = $prot . " " . $ln;
				dbgit("#read_proto.46# macro prot now=$prot\n");
				last;
			}
		}
		else {
			$prot = $prot . " " . $ln;
			dbgit("#read_proto.48# func prot now=$prot\n");
		}
		last if $ln =~ $ending;
	}
	return $prot;
}

sub save_funcinfo($$$) {
	my $fnc = shift;
	my $prot = shift;
	my $syscall = shift;

	dbgit("#save_funcinfo# fnc=$fnc, prot=$prot, syscall=$syscall\n");
	$funcnames{$fnc} = $fnc;
	$funcflags{$fnc} = FF_NONE;
	$funcflags{$fnc} |= FF_STATIC if ($prot =~ "\s*static\s*");
	$funcflags{$fnc} |= FF_INLINE if ($prot =~ "\s*inline\s*");
	$funcflags{$fnc} |= FF_DEF_FUNC if ($prot =~ "\s*define\s*"); # func-like
	$funcflags{$fnc} |= FF_SYSCALL if ($syscall);
}

sub save_nonfuncinfo($$$) {
	my $type = shift;
	my $fnc = shift;
	my $prot = shift;

	dbgit("#save_nonfuncinfo# type=$type, fnc=$fnc, prot=$prot\n");
	$funcnames{$fnc} = $fnc;
	$funcflags{$fnc} = FF_NONE;
	$funcflags{$fnc} |= FF_STATIC if ($prot =~ "\s*static\s*");

	$funcflags{$fnc} |= FF_ENUM   if ($type eq "enum");
	$funcflags{$fnc} |= FF_TYPEDEF if ($type eq "typedef");
	$funcflags{$fnc} |= FF_STRUCT if ($type eq "struct");
	$funcflags{$fnc} |= FF_UNION  if ($type eq "union");
	$funcflags{$fnc} |= FF_DEF_OBJ if ($prot =~ "\s*define\s*"); # object macro
}

sub show_flags($) {
	my $fflags = shift;

	return "static inline" if $fflags == (FF_STATIC | FF_INLINE);
	return "static" if $fflags == FF_STATIC;
	return "inline" if $fflags == FF_INLINE;
	return "enum"   if $fflags == FF_ENUM;
	return "typedef" if $fflags == FF_TYPEDEF;
	return "struct" if $fflags == FF_STRUCT;
	return "union"  if $fflags == FF_UNION;
	return "define" if $fflags == FF_DEF_FUNC;
	return "define" if $fflags == FF_DEF_OBJ;
	#return "" if ($fflags & (FF_STATIC | FF_INLINE) == 0);
	return "none" if $fflags == 0;
	return "unknown (" . $fflags . ")";
}

sub dump_saved_kerndoc() {

	my $cnt = scalar %funcnames;

	#dbgit("funcnames:");
	#dbgit(%funcnames);
	#dbgit("\n");

	while ((my $key, my $value) = each %funcnames) {
		my $flags = show_flags($funcflags{$key});
		dbgit("kdoc saved for $key, flags: $flags\n");
	}

	print "$cnt kernel-docs found/saved\n";
}

sub dump_saved_exports() {

	my $cnt = scalar %exports;

	#verbose("#dump_saved_exports# exports:");
	#verbose(%exports);
	#verbose("\n");

	while ((my $key, my $value) = each %exports) {
		dbgit("EXPORT saved for: $key\n");
	}

	print "$cnt Exported symbols found/saved\n";
}

# search saved kernel-docs and report missing EXPORT if found kernel-doc without EXPORT
sub check_missing_exports() {

	my $cnt = 0;

	while ((my $key, my $value) = each %funcnames) {
		my $flags = show_flags($funcflags{$key});
		if (! ($funcflags{$key} & FF_SYSCALL)) { # EXPORT not needed/not expected
		if ($exports{$key} eq undef) {
			if (($funcflags{$key} & FF_NONFUNC) == 0) { # is a func
			    if (($funcflags{$key} & (FF_STATIC | FF_INLINE)) == 0 &&
				(($funcflags{$key} & (FF_DEF_FUNC | FF_DEF_OBJ)) == 0)) {
				print "Missing EXPORT for: $key\n";
				++$cnt;
			  } # end not static/inline
			} # end is func
		} # end undef
		} # end syscall
	}

	print "$cnt missing Exports\n";
}

# search saved Exports and report missing kernel-doc if found EXPORT without kernel-doc
sub check_missing_kerndoc() {

	my $cnt = 0;

	while ((my $key, my $value)= each %exports) {
		if ($funcnames{$key} eq undef) {
			print "Missing kernel-doc for: $key\n";
			++$cnt;
		}
	}

	print "$cnt missing kernel-docs\n";
}

sub syscall_munge($) {	# from kernel old scripts/kernel-doc.pl;
	my $prot = shift;
	my $void = 0;

	dbgit("#syscall_munge.10# prot=$prot\n");
	$prot =~ s@[\r\n]+@ @gos; # strip newlines/CR's
##	if ($prot =~ m/SYSCALL_DEFINE0\s*\(\s*(a-zA-Z0-9_)*\s*\)/) {
	if ($prot =~ m/SYSCALL_DEFINE0/) {
		$void = 1;
##		$prot = "long sys_$1(void)";
    }

	$prot =~ s/SYSCALL_DEFINE.*\(/long sys_/; # fix return type & func name
	dbgit("#syscall_munge.20# prot=$prot\n");
	if ($prot =~ m/long (sys_.*?),/) {
		$prot =~ s/,/\(/;
	} elsif ($void) {
		$prot =~ s/\)/\(void\)/;
	}
	dbgit("#syscall_munge.30# prot=$prot\n");

	# now delete all of the odd-number commas in $prototype
	# so that arg types & arg names don't have a comma between them
	my $count = 0;
	my $len = length($prot);
	if ($void) {
		$len = 0;    # skip the for-loop
	}
	for (my $ix = 0; $ix < $len; $ix++) {
		if (substr($prot, $ix, 1) eq ',') {
			$count++;
			if ($count % 2 == 1) {
				substr($prot, $ix, 1) = ' ';
			}
		}
	}
	dbgit("#syscall_munge.50# prot=$prot\n");

	return $prot;
}


# begin/start/main:

while ($#ARGV >= 0) {
	my $what = $ARGV[0];
	if ($what eq "--help" || $what eq "-h") {
		usage();
	}
	if ($what eq "-l" || $what eq "--list") {
		shift;
		$opt_list = 1;
		next;
	}
	if ($what eq "-v" || $what eq "--verbose") {
		shift;
		$opt_verbose = 1;
		next;
	}
	if ($what eq "-x") {
		shift;
		$opt_debug = 1;
		next;
	}
	last;
}

foreach my $file (@ARGV) {
	open (FILE, $file) || die "Cannot open $file: $!\n";
	print "\nfile: $file\n";

	my $kerndoc_count = 0;
	$warn_count = 0;
	my $start_shortdesc = 0;
	my $shortdesc = "";
	my $desctype;
	my $proto = "";
	my $syscall = 0;

	%funcnames = ();
	%funcflags = ();
	%exports = ();

LINE:
	while ($line = <FILE>) {	# read lines from FILE
		chomp $line;
		next LINE if ($line =~ /\*\*\*\*\*/);

		if ($line eq "/\*\*") { # must be alone at start of line
			$start_shortdesc = 1;
			next LINE;
		}

		elsif ($line =~ /\s*\/\*\*$/) {
			warning($file, $., "kernel-doc sentinel not at start of line");
			next LINE;
		}

		elsif ($line =~ '/\*\*') { # but not alone
			warning($file, $., "kernel-doc sentinel has trailing text");
			#next LINE;
			$start_shortdesc = 1;
			$line =~ s:/\*\*:\*: # assume funcname is on the same line
			# continue below
		}

		elsif ($line =~ $export_symbol) {
			#$funcnames{$2} = 1;
			dbgit("#LINE# found 'export_symbol' for:$2\n");
			$exports{$2} = 1;
			next LINE;
		}
		elsif ($line =~ $export_symbol_ns1) {
			#$funcnames{$2} = 1;
			dbgit("#LINE# found 'export_symbol_ns1' for:$2\n");
			$exports{$2} = 1;
			next LINE;
		}
		elsif ($line =~ $export_symbol_ns2) {
			##$funcnames{$2} = 1;
			dbgit("#LINE# found 'export_symbol_ns2' for:$2\n");
			$exports{$2} = 1;
			next LINE;
		}
		elsif ($line =~ $export_symbol_nsx) {
			##$funcnames{$2} = 1;
			dbgit("#LINE# found 'export_symbol_nsx' for:$2\n");
			$exports{$2} = 1;
			next LINE;
		}

		if ($start_shortdesc) {
			dbgit("#LINE.50# want to find shortdesc in |$line|\n");
			$start_shortdesc = 0;
			# but this can easily be a false positive, so check $line:
			next LINE if ($line =~ /^\s*\*\s*$/); # mostly empty
			next LINE if ($line =~ /^\s*\*\*/); # double-*
			next LINE if ($line =~ /^\s*\*\s*DOC:/); # skip DOC:
			next LINE unless ($line =~ /^\s*\*\s*/); # must be *-line
			next LINE unless ($line =~ /:/) || ($line =~ /-/);

			$shortdesc = $line; # only first line
			$kerndoc_count++;
			dbgit("#LINE.60# shortdesc = line =|$line|\n");

			read_discard_desc(); # discard up thru "*/"
			$desctype = find_type($shortdesc);
			dbgit("#LINE.70# got desctype =|$desctype|, shortdesc=$shortdesc\n");
			$proto = read_proto($desctype);

			dbgit("#LINE.80# desctype=$desctype, shortdesc=$shortdesc, proto=$proto\n");

			if ($desctype eq "func") {
				my $func;
				if ($shortdesc =~ /\s*\*\s*(.*)\s*[-:]/) {
					$func = $1;
					$func =~ s/\s*$//; # drop trailing spaces
					#$func =~ s/\(\s*\)//; # drop "()"s
					$func =~ s/\(.*\)//; # drop "(...)"s
					# $func may contain some of the function
					# short description :( due to greedy
					# pattern matching, so eliminate it
					$func =~ s/-\s*.*$//;
					$func =~ s/\s*$//; # drop trailing spaces
				} else {
					$func = $shortdesc;
				}
				dbgit("#func# func=$func, proto=$proto\n");
				if ($proto =~ /SYSCALL_DEFINE/) {
					$syscall = 1;	# no EXPORT needed
					$proto = syscall_munge($proto);
				}
				save_funcinfo($func, $proto, $syscall);
				$syscall = 0;
				if (index($proto, $func) == -1) {
					warning($file, $., "kernel-doc function name: '$func' does not match prototype: $proto");
				}

				if ($opt_list) {
					# print $filename:linenum:$function: $shortdesc
					print "$file: $.: $func: $shortdesc\n";
				}
			} # desctype eq func

			else { # handle enum, typedef, struct, union, define
				my $name;
				dbgit("#nonfunc# shortdesc.10=$shortdesc, proto=$proto\n");
				$shortdesc =~ s/\*\s*$desctype//;
				dbgit("#nonfunc# shortdesc.20=$shortdesc, proto=$proto\n");

				if ($shortdesc =~ /\s*\*?\s*(.*)\s*[-:]/) {
					$name = $1;
					$name =~ s/\s*$//; # drop trailing spaces
					$name =~ s/\(\s*\)//; # drop "()"s
					# $func may contain some of the function
					# short description :( due to greedy
					# pattern matching, so eliminate it
					$name =~ s/-\s*.*$//;
					$name =~ s/\s*$//; # drop trailing spaces
					dbgit("#nonfunc# name=$name, shortdesc.30=$shortdesc, proto=$proto\n");
				} else {
					$name = $shortdesc;
				}
				# remove both leading and trailing spaces
				#$name =~ s/^\s+|\s+$//g;
				save_nonfuncinfo($desctype, $name, $proto);

				if ($opt_list) {
					# print $filename:linenum:$desctype $name: $shortdesc
					print "$file: $.: $desctype $name: $shortdesc\n";
				}
			} # end non-func desctype
		} # end start_shortdesc
	} # end while $line

	close FILE;
	print "----- file $file: $kerndoc_count kernel-doc blocks, $warn_count kernel-doc warnings -----\n";

	dump_saved_kerndoc() if $opt_verbose;
	dump_saved_exports() if $opt_verbose;

	check_missing_kerndoc();
	check_missing_exports();

} # end foreach $file
# end;

--------------WTZTRdUPp0NqvjYNs0rco7TN--

