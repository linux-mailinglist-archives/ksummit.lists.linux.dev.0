Return-Path: <ksummit+bounces-943-lists=lfdr.de@lists.linux.dev>
X-Original-To: lists@lfdr.de
Delivered-To: lists@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id B3EF8744031
	for <lists@lfdr.de>; Fri, 30 Jun 2023 18:55:17 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 6D760280FF8
	for <lists@lfdr.de>; Fri, 30 Jun 2023 16:55:16 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 22F1E168C0;
	Fri, 30 Jun 2023 16:55:10 +0000 (UTC)
X-Original-To: ksummit@lists.linux.dev
Received: from outgoing.mit.edu (outgoing-auth-1.mit.edu [18.9.28.11])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 886B81643E
	for <ksummit@lists.linux.dev>; Fri, 30 Jun 2023 16:55:03 +0000 (UTC)
Received: from cwcc.thunk.org (pool-173-48-82-24.bstnma.fios.verizon.net [173.48.82.24])
	(authenticated bits=0)
        (User authenticated as tytso@ATHENA.MIT.EDU)
	by outgoing.mit.edu (8.14.7/8.12.4) with ESMTP id 35UGsotO002974
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Fri, 30 Jun 2023 12:54:51 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=mit.edu; s=outgoing;
	t=1688144092; bh=DsldHsec5dx+EPO9aeop5ZyiyQarlKZTIXpnIcL0Rk0=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=JWiGPBzR9S03Qdbwa9OAUbQCNvgtxr3Z1H2pEM5AizDEV7qev+lSfh3k72CGm6oo+
	 s22HNJtr/HI3pNgs0y5mEEvGktgzUbgmoqijiNCEHe49omfZvF4HprNH90Fc6h55WH
	 gIR/t/bRcSmFJYcMBXy8bBcOZ23kRfzvUEQ9eSzoK+Jy5N3d0S7p0M22LAULWvuoco
	 vV7R5HEPX07iQ8r0+g7cFWICYG8yUCwqbD0AbAnwyJRNghcB3qfS7uHaWghpv5EkyL
	 zmJ94o6QslyF0fPOP1Aa3Cch9FaLHNaomqDKhHm5IbnPWmlcFs8G5BIqJbMmuWCG0L
	 LfuQ0kzqxqDSg==
Received: by cwcc.thunk.org (Postfix, from userid 15806)
	id 16EA315C027F; Fri, 30 Jun 2023 12:54:50 -0400 (EDT)
Date: Fri, 30 Jun 2023 12:54:50 -0400
From: "Theodore Ts'o" <tytso@mit.edu>
To: Jonathan Corbet <corbet@lwn.net>
Cc: Jani Nikula <jani.nikula@intel.com>, ksummit@lists.linux.dev
Subject: Re: Intersphinx ([TECH TOPIC] Kernel documentation)
Message-ID: <20230630165450.GB591635@mit.edu>
References: <87fs6rxppz.fsf@meer.lwn.net>
 <871qi6glzl.fsf@intel.com>
 <87y1k2kl5a.fsf@meer.lwn.net>
Precedence: bulk
X-Mailing-List: ksummit@lists.linux.dev
List-Id: <ksummit.lists.linux.dev>
List-Subscribe: <mailto:ksummit+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:ksummit+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <87y1k2kl5a.fsf@meer.lwn.net>

On Thu, Jun 29, 2023 at 03:34:41PM -0600, Jonathan Corbet wrote:
> So for anybody who is interested, I went and revisited this.  Actually
> splitting the docs into separate books would not be that hard, and
> intersphinx will indeed manage the cross-references between them without
> a lot of extra effort on our part.
> 
> There is a catch, though: In order to be able to create the cross
> references, intersphinx has to be able to read the "objects.inv" file
> for every other document it refers to.  That file, of course, is created
> by building the docs.  In practice this means that, to generate a
> complete set of manuals from a clean repository, it would be necessary
> to do *two* complete builds - one to create the inventory files, and one
> to use them.

Yeah, that's a bit of a bummer.  It sounds a bit like TeX/LaTeX's
various *.aux files that are used to generate the numbers for
foornotes, et.al.  But I'll note that while I would do two passes of
running LaTeX before doing sending out the final version of my paper,
most of the time, I'd only run LaTeX once, and live with the fact that
some section numbers or footnotes would be something like [???]
instead of containing the properreference.

From the perspective of someone who is editing the docs, how
usable/unusable is the sphinx output without these inventory files?  Or
if the inventory files are out of date?  And am I right they only
change when someone adds a new section, or a new anchor point for a
cross reference, etc.?

If the goal is for someone to check and see whether the output of a
particular part of the docs looks OK after doing a quick edit (e.g.,
did I mess up a table), it would seem that doing a single pass of a
single "book" would be faster, right?  And would it be good enough for
them to make sure that their edits to a particular .rst file looked
OK?

I also wonder if there's a way people could download inventory files
from some web site so their first pass run of sphinx would look
prettier?  Assuming that intersphinx can deal with slightly
out-of-sync inventory files, of course....

						- Ted

