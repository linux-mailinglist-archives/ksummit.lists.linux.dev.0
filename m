Return-Path: <ksummit+bounces-2100-lists=lfdr.de@lists.linux.dev>
X-Original-To: lists@lfdr.de
Delivered-To: lists@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 7882EB1C806
	for <lists@lfdr.de>; Wed,  6 Aug 2025 16:58:06 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id A46045631F9
	for <lists@lfdr.de>; Wed,  6 Aug 2025 14:58:06 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 7FFD3220F25;
	Wed,  6 Aug 2025 14:58:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=mit.edu header.i=@mit.edu header.b="LT03hSsA"
Received: from outgoing.mit.edu (outgoing-auth-1.mit.edu [18.9.28.11])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 95BB642A99
	for <ksummit@lists.linux.dev>; Wed,  6 Aug 2025 14:58:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=18.9.28.11
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1754492282; cv=none; b=BlLyJxHCP8oD3oCDqgf4ZbT72bYRPIBJqhL5u1HVtfY8XA9UzUnER8xEjfPxZCOAkGuXF4I6c3MsuuzCcmZZH4vR6Ns4b3BDVBfdybm6B0Fa5+ahOLqJfvNhErRq9NtmndXXx3/KAR60TfsqG/bbTHtvZ63y5VHfOVkw5p4UkOk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1754492282; c=relaxed/simple;
	bh=08V3W7KxZE+I2fWDyxSbFbS5s77jsD8vm7QLoxsbPEU=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=ptDUeqHV3Ukogtmn5Eyz9T80H7lFC8ukv3Euzjs9JayAzecfxF1Nc0AwtpHkZ3H9rajy/E+LCALVh9LSJvlG8M5ybh0EWHS5DVhPEaTyEnz9CnOtiY2BXwJhYtHZITCO7yOZF1VdHeuwMOzPceP668VG2nT6z8GjCHpfkKhFk+8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=mit.edu; spf=pass smtp.mailfrom=mit.edu; dkim=pass (2048-bit key) header.d=mit.edu header.i=@mit.edu header.b=LT03hSsA; arc=none smtp.client-ip=18.9.28.11
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=mit.edu
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=mit.edu
Received: from trampoline.thunk.org (pool-173-48-102-183.bstnma.fios.verizon.net [173.48.102.183])
	(authenticated bits=0)
        (User authenticated as tytso@ATHENA.MIT.EDU)
	by outgoing.mit.edu (8.14.7/8.12.4) with ESMTP id 576Evh7I018302
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Wed, 6 Aug 2025 10:57:44 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=mit.edu; s=outgoing;
	t=1754492266; bh=WmQIqBeedxduaj01w6XEV+d2QvaX7WAsmISFPfCIgks=;
	h=Date:From:Subject:Message-ID:MIME-Version:Content-Type;
	b=LT03hSsAqXSF9+qIu1eE866iQHm3Lu5cI5ly26LsP8ZjCd2TdvRxI8R/C/JcNLDBN
	 u8M66XX6vkmgKXVVqZRS6wHCB+U9t8o1Uf9BykBd2fe1yBYaxFtGj6k6GUU4XxzUkN
	 cRyZaUbUlNkeJ1vBeezBBu6jWHDJKNE5ZWmMZCla/+BhoAAknvFn/i9et1Qsu5YK2i
	 r+XkXlsCmEmosPdEq73AVt6NESJUg2sEWFeilJZPGjhx1BFCEHzUqq+ZefQh0pWowa
	 XpvqNcqLM8ajIGAMN4iyw0Mo35luSzo1MMevq2WrrTmo3nZPX+DvaUCTLOT2o9aGtm
	 NMX1fGWSYHoLQ==
Received: by trampoline.thunk.org (Postfix, from userid 15806)
	id B002E2E00D6; Wed, 06 Aug 2025 10:57:43 -0400 (EDT)
Date: Wed, 6 Aug 2025 10:57:43 -0400
From: "Theodore Ts'o" <tytso@mit.edu>
To: Mark Brown <broonie@kernel.org>
Cc: Sasha Levin <sashal@kernel.org>, Geert Uytterhoeven <geert@linux-m68k.org>,
        Steven Rostedt <rostedt@goodmis.org>, Jiri Kosina <jkosina@suse.com>,
        ksummit@lists.linux.dev, Greg KH <gregkh@linuxfoundation.org>
Subject: Re: [MAINTAINERS SUMMIT] The amount of -stable emails
Message-ID: <20250806145743.GB778805@mit.edu>
References: <162r47q9-rp56-67so-7032-2r1rn36p03n6@fhfr.pbz>
 <9dbe8a42-e43a-4beb-acfa-3ed1c069fa47@sirena.org.uk>
 <20250805122828.68312a8d@gandalf.local.home>
 <09a8f276-916f-45e9-bd63-ffddecf1be9a@sirena.org.uk>
 <CAMuHMdWapDrTn6Tv=YA+s1kcT8A3TrXu2F35sPcv8RHSJyYWXQ@mail.gmail.com>
 <63d3abec-1c1e-4828-a05a-1348d840ffaf@sirena.org.uk>
 <aJNIckP-3MBG4FFR@lappy>
 <ddf35e41-05ff-4a3f-a949-1fd55e1b6a79@sirena.org.uk>
Precedence: bulk
X-Mailing-List: ksummit@lists.linux.dev
List-Id: <ksummit.lists.linux.dev>
List-Subscribe: <mailto:ksummit+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:ksummit+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <ddf35e41-05ff-4a3f-a949-1fd55e1b6a79@sirena.org.uk>

On Wed, Aug 06, 2025 at 01:24:47PM +0100, Mark Brown wrote:
> On Wed, Aug 06, 2025 at 08:20:02AM -0400, Sasha Levin wrote:
> > On Wed, Aug 06, 2025 at 11:42:03AM +0100, Mark Brown wrote:
> 
> > > TBH I think a summary would help there - currently you're looking at six
> > > threads for all the different stables and have to check every patch in
> > > each, if we were instead getting a summary that says that patch A has
> > > been backported to stables X-Y then it'd highlight more clearly if
> > > something wasn't pulled far enough back.
> 
> > Something along the lines of
> > https://lore.kernel.org/all/20250805130945.471732-1-sashal@kernel.org/ ?
> 
> Yes.  Possibly also putting the range in the body in case people find
> that more visible when reading the thread?

This is a bit of a tangent, but something that I think would be
*really* cool is if there was a web dashboard which displayed commits
that were either (a) tagged with a Fixes: or cc: stable, (b)
explicitly requested by a maintainer / developer, (c) backported
because it was a dependency needed for (a) or (b), and showed links to
commits to the LTS links where it was a backported, and optionally a
link to the "couldn't backport automatically" e-mail if it couldn't be
backported.  It would also be useful if dashboard reported whether
there was a CVE associated with the commit.

The dashboard should be searchable by subsystem, and/or by date or
kernel version range.  And it would be nice if maintainers could
subscribe to periodic update e-mails on a per-subsystem basis.

If we think this would be useful, perhaps we could try to see if we
could get LF funding/support to create such a developer tool?

      	     		     	       	    - Ted

