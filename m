Return-Path: <ksummit+bounces-2263-lists=lfdr.de@lists.linux.dev>
X-Original-To: lists@lfdr.de
Delivered-To: lists@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id D5A60B3F146
	for <lists@lfdr.de>; Tue,  2 Sep 2025 00:57:05 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 714B93B0608
	for <lists@lfdr.de>; Mon,  1 Sep 2025 22:57:04 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 5DE7E2857CF;
	Mon,  1 Sep 2025 22:57:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="mib+2BYK"
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D2DBB2AD25;
	Mon,  1 Sep 2025 22:56:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1756767419; cv=none; b=EOgnzVESy3P2ta4g1Zk2aJ1bD+NvKEkLSv4Sjg9NRxNKMsEBKZZKzLIcCzHRWyBTH03irVtc6e4s9JGDoUDO7W0Z29dFhFYudinoAaBBMUoejF+57wjCTdImnUP38mQMY9VVimPv4w+DaGsTvKFwnBrvLw4ZHjSOJ4O/e8Hpgy4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1756767419; c=relaxed/simple;
	bh=LdDIc/MtsOcr80Vnj9watM/OJc5KNT9do49vf44k4KU=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=fTP1lb1zZgKo71I/vu/srfuWtbd2n4GOx3MsbounnbvA+1/mDKRf2p+krMCZCb7XhY/csyqOK312jRko9kE8OjBO0VIz5Wek4N2qdTQJy/ikOF1+2deN8kt4DFdfGu7kVfmj+cz6Tx53QaTfsNtMzGCHcCztbzwoggqjz3Yeqqg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=mib+2BYK; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 5B060C4CEF0;
	Mon,  1 Sep 2025 22:56:59 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1756767419;
	bh=LdDIc/MtsOcr80Vnj9watM/OJc5KNT9do49vf44k4KU=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=mib+2BYKinBssJc1ZNZ3waL3V3rjDu9AOH6uKdYVWcXjrfqrxLz/Pv0+OQ+/QmaeJ
	 ZBNwW9OvveZcNppEQf16vQ9YwQ/fJs/rnHHnkWUPqfJh9sujB6Ix+UYJS7WvWwL8TJ
	 blCinaaln7UixyYK17fSC5OwogvAE7+11xVpwEHTwcG7J8TIkDoFO4VPEKJbs+5dUx
	 D+89oW8jr18zEz9fWdDzpbLJXX2B/STJtU1NT4ah+WeAw8J4eZbbWQiWvvDv1YG1Rh
	 K1jpo/aZ8tKpsW3ykzrVNtT4dPWX/YcfKR42o1OFqWQmMBwOhgjvB3HzV1IP1L+F16
	 60QKfxao3zO5A==
Received: from mchehab by mail.kernel.org with local (Exim 4.98.2)
	(envelope-from <mchehab+huawei@kernel.org>)
	id 1utDSL-00000003P5S-0vxM;
	Tue, 02 Sep 2025 00:56:57 +0200
Date: Tue, 2 Sep 2025 00:56:57 +0200
From: Mauro Carvalho Chehab <mchehab+huawei@kernel.org>
To: Mark Brown <mchehab+huawei@kernel.org>
Cc: Mauro Carvalho Chehab <mchehab+huawei@kernel.org>, 
	Randy Dunlap <rdunlap@infradead.org>, Jani Nikula <jani.nikula@intel.com>, 
	Jonathan Corbet <corbet@lwn.net>, Laurent Pinchart <laurent.pinchart@ideasonboard.com>, 
	Vegard Nossum <vegard.nossum@oracle.com>, ksummit@lists.linux.dev, 
	Linux Documentation <linux-doc@vger.kernel.org>, Mauro Carvalho Chehab <mchehab+huawei@kernel.org>, 
	Akira Yokosawa <akiyks@gmail.com>, Bagas Sanjaya <bagasdotme@gmail.com>, 
	Matthew Wilcox <willy@infradead.org>
Subject: Re: [TECH TOPIC] Kernel documentation - update and future directions
Message-ID: <j3iblg4xx4nu64dgaxhl62mtherszeh3jyrskkf7l2jigld7wf@lr7mtq33gbi7>
References: <87wm6l0w2y.fsf@trenco.lwn.net>
 <930d1b37-a588-43db-9867-4e1a58072601@oracle.com>
 <20250830222351.GA1705@pendragon.ideasonboard.com>
 <87h5xo1k6y.fsf@trenco.lwn.net>
 <20250831160339.2c45506c@foz.lan>
 <b452388b7796bba710790ceb5759b75ec6e57f23@intel.com>
 <b41031ca-b4a4-450d-a833-5affefe958b2@infradead.org>
 <2f927f53-9af5-4e0c-be8f-f7bdf90e23ff@sirena.org.uk>
 <20250901204635.51b81ffd@foz.lan>
 <1bf8a898-e697-46e2-86b1-4158b021d652@sirena.org.uk>
Precedence: bulk
X-Mailing-List: ksummit@lists.linux.dev
List-Id: <ksummit.lists.linux.dev>
List-Subscribe: <mailto:ksummit+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:ksummit+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <1bf8a898-e697-46e2-86b1-4158b021d652@sirena.org.uk>
Sender: Mauro Carvalho Chehab <mchehab+huawei@kernel.org>

On Mon, Sep 01, 2025 at 07:52:01PM +0100, Mark Brown wrote:
> On Mon, Sep 01, 2025 at 08:46:35PM +0200, Mauro Carvalho Chehab wrote:
> 
> > It should be noticed that kernel-doc doesn't run in parallel. Python
> > still suffers for a global big lock (called GIL). My attempts to run in
> > parallel actually made kernel-doc slower, but this is changing: the
> > next Python version is planning to get rid of GIL. So, maybe within
> > a year we can re-add the patches to run it in parallel.
> 
> It'll take a lot longer for that to filter out to people's machines, for
> example I'm running Debian stable on my desktop and I know a lot of
> people have Ubuntu LTS.
> 
> > > That
> > > compares unfavourably with allmodconfig on this system:
> > > 
> > >   $ time make -j56 allmodconfig
> > >   ...
> > >   make -j56 allmodconfig  5.31s user 1.93s system 146% cpu 4.931 total
> > >   $ time make -j56
> > >   ...
> > >   make -j56  53468.11s user 4387.30s system 5084% cpu 18:57.77 total
> > > 
> > > and seems rather more likely to flag something for me.
> 
> > 32 seconds more, on the top of 53468.11s doesn't sound that much.
> 
> Yeah, if it was of that sort of order, ran clean with mainline and could
> be checked automatically it'd be a lot more viable.

If you run:

	 kernel-doc . --none -Wall

You won't have troubles with Sphinx slowness. It would be worth timing
it on you machine and see how much time it takes to run. Probably
the run time depends a little bit on the Python version. Not sure how
much optimization it got(*).

(*) Here, I use Fedora 42, so it is a recent Python version, but I
    gues even on Debian and Ubuntu LTS, if python version affects,
    you can install a newer version from the official packages.

-- 
Thanks,
Mauro

