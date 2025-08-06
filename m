Return-Path: <ksummit+bounces-2106-lists=lfdr.de@lists.linux.dev>
X-Original-To: lists@lfdr.de
Delivered-To: lists@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 005B5B1CE82
	for <lists@lfdr.de>; Wed,  6 Aug 2025 23:35:53 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id CEF5818C4C6D
	for <lists@lfdr.de>; Wed,  6 Aug 2025 21:36:11 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id E975F21FF33;
	Wed,  6 Aug 2025 21:35:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="P9cUFWrK"
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 70DE822A4E5
	for <ksummit@lists.linux.dev>; Wed,  6 Aug 2025 21:35:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1754516146; cv=none; b=hnrl8zv+lt7xCq897dTyMCrZosTPI5Kpf9UF1uSVLgAebRcomXA1V2k64Mz/X4WLQSiwDuAo0Ijg0WtIJR83jYXCt1n9wggUrMPAZHd/cvfUZY5LKShTQ4w2oQIcNcOUdgS02xLOO/pR1mEoX0pDmf4KcYD+JgxPeFo3hGds71E=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1754516146; c=relaxed/simple;
	bh=gcdnMFsapWUD3nxPP4I4DSpEfNaZ6mDBw00lQC6Zj+A=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=jURlJYxffXTAzQofdHAZHF8C/ihXCqWLdNOKrP9JnfQNBQCyHF0b5XgvKXJPInI0ZvPzyAghnbhS0oG21LlhNpKReT35lrDpQJakCgPzM9SlijMjW2bgX7BXp89aEB4H1jlpHZpdnGTyMfmRebGxAh8t94/7DI/HK5xLOAfmYmA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=P9cUFWrK; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id BDA94C4CEE7;
	Wed,  6 Aug 2025 21:35:44 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1754516145;
	bh=gcdnMFsapWUD3nxPP4I4DSpEfNaZ6mDBw00lQC6Zj+A=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=P9cUFWrKeQjAoeM4v4VpWtgNlIWnL5l0y3+mfBSFZbftUYclxkzYg1r2nnvo47iGF
	 TIFxGbMF4vAFrSrybH04t/eERpwLIHJISZX0mHzdy+OL6vMuERff5ewCSOz0h58b0p
	 W7kYywHdLM24PIA+sGRBtpo3RuHUV0c5PyORhHX0k1Zy3e/PU0koN0H5YHv7nS1EFl
	 h+5WU8MTUG8opDhOGZG1928P9AAuIGn002nxmWkafGcEW6wo+3zeDOGK8wofzctbFo
	 Mhokv52UEjkfWkYc+etKaG1szI2+SHSRYCW+CuqKZTsMMYFAm1XVr5XeRUKXH7358P
	 I3v4Y0lr3JiiA==
Date: Wed, 6 Aug 2025 17:35:42 -0400
From: Sasha Levin <sashal@kernel.org>
To: Theodore Ts'o <tytso@mit.edu>
Cc: Mark Brown <broonie@kernel.org>,
	Geert Uytterhoeven <geert@linux-m68k.org>,
	Steven Rostedt <rostedt@goodmis.org>,
	Jiri Kosina <jkosina@suse.com>, ksummit@lists.linux.dev,
	Greg KH <gregkh@linuxfoundation.org>
Subject: Re: [MAINTAINERS SUMMIT] The amount of -stable emails
Message-ID: <aJPKrlaz9jYeRo43@lappy>
References: <162r47q9-rp56-67so-7032-2r1rn36p03n6@fhfr.pbz>
 <9dbe8a42-e43a-4beb-acfa-3ed1c069fa47@sirena.org.uk>
 <20250805122828.68312a8d@gandalf.local.home>
 <09a8f276-916f-45e9-bd63-ffddecf1be9a@sirena.org.uk>
 <CAMuHMdWapDrTn6Tv=YA+s1kcT8A3TrXu2F35sPcv8RHSJyYWXQ@mail.gmail.com>
 <63d3abec-1c1e-4828-a05a-1348d840ffaf@sirena.org.uk>
 <aJNIckP-3MBG4FFR@lappy>
 <ddf35e41-05ff-4a3f-a949-1fd55e1b6a79@sirena.org.uk>
 <20250806145743.GB778805@mit.edu>
Precedence: bulk
X-Mailing-List: ksummit@lists.linux.dev
List-Id: <ksummit.lists.linux.dev>
List-Subscribe: <mailto:ksummit+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:ksummit+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii; format=flowed
Content-Disposition: inline
In-Reply-To: <20250806145743.GB778805@mit.edu>

On Wed, Aug 06, 2025 at 10:57:43AM -0400, Theodore Ts'o wrote:
>On Wed, Aug 06, 2025 at 01:24:47PM +0100, Mark Brown wrote:
>> On Wed, Aug 06, 2025 at 08:20:02AM -0400, Sasha Levin wrote:
>> > On Wed, Aug 06, 2025 at 11:42:03AM +0100, Mark Brown wrote:
>>
>> > > TBH I think a summary would help there - currently you're looking at six
>> > > threads for all the different stables and have to check every patch in
>> > > each, if we were instead getting a summary that says that patch A has
>> > > been backported to stables X-Y then it'd highlight more clearly if
>> > > something wasn't pulled far enough back.
>>
>> > Something along the lines of
>> > https://lore.kernel.org/all/20250805130945.471732-1-sashal@kernel.org/ ?
>>
>> Yes.  Possibly also putting the range in the body in case people find
>> that more visible when reading the thread?
>
>This is a bit of a tangent, but something that I think would be
>*really* cool is if there was a web dashboard which displayed commits
>that were either (a) tagged with a Fixes: or cc: stable, (b)
>explicitly requested by a maintainer / developer, (c) backported
>because it was a dependency needed for (a) or (b), and showed links to
>commits to the LTS links where it was a backported, and optionally a
>link to the "couldn't backport automatically" e-mail if it couldn't be
>backported.  It would also be useful if dashboard reported whether
>there was a CVE associated with the commit.
>
>The dashboard should be searchable by subsystem, and/or by date or
>kernel version range.  And it would be nice if maintainers could
>subscribe to periodic update e-mails on a per-subsystem basis.
>
>If we think this would be useful, perhaps we could try to see if we
>could get LF funding/support to create such a developer tool?

I had a similar idea about two months ago, and came up with
https://sashalevin.github.io/ . This is very much work in progress and I
wouldn't rely on the data currently in the dashboard.

Due to travel in the last couple of weeks progress was blocked, but I'm
hoping to have this in a good state for LPC to showcase it and get some
feedback in person. I wrote down your ideas around subsystem filtering,
CVE integration, and date filtering. Thanks! :)

This is one of the things AI has enabled me to do. I really don't think
that we need to go to the LF to get funding for this, at least not for
the 90% of the benefit that the dashboard will provide.

Sasha Levin, web developer, at your service :)

-- 
Thanks,
Sasha

