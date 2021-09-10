Return-Path: <ksummit+bounces-496-lists=lfdr.de@lists.linux.dev>
X-Original-To: lists@lfdr.de
Delivered-To: lists@lfdr.de
Received: from sjc.edge.kernel.org (sjc.edge.kernel.org [IPv6:2604:1380:1000:8100::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 509E34072F6
	for <lists@lfdr.de>; Fri, 10 Sep 2021 23:33:02 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sjc.edge.kernel.org (Postfix) with ESMTPS id DD7FD3E10C7
	for <lists@lfdr.de>; Fri, 10 Sep 2021 21:33:00 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 49DFE2FB6;
	Fri, 10 Sep 2021 21:32:54 +0000 (UTC)
X-Original-To: ksummit@lists.linux.dev
Received: from wout2-smtp.messagingengine.com (wout2-smtp.messagingengine.com [64.147.123.25])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 871ED3FC3
	for <ksummit@lists.linux.dev>; Fri, 10 Sep 2021 21:32:52 +0000 (UTC)
Received: from compute5.internal (compute5.nyi.internal [10.202.2.45])
	by mailout.west.internal (Postfix) with ESMTP id BF2313200A67;
	Fri, 10 Sep 2021 17:32:51 -0400 (EDT)
Received: from mailfrontend2 ([10.202.2.163])
  by compute5.internal (MEProxy); Fri, 10 Sep 2021 17:32:51 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	joshtriplett.org; h=date:from:to:cc:subject:message-id
	:references:mime-version:content-type:in-reply-to; s=fm1; bh=dTr
	AySnNi0NIl1s1zYFvalJ4njaRevDPGuETAGi4TWo=; b=OHCZYyqnfq2GIyeF+cl
	RlB5x8YizFsx1JwXtTf+dFa2fQJqtePvRwsMdfJ2fLqJpwOeBJgXBW2Kj3gqDF1z
	fmE2kyweuG7Cx4NphWObUTyvuzstmWSlEjTxivYzhuRWGRuHd1lfz65Yy3BdQezR
	Iu3FKA5empIhz3pW0dtkDQVE+H9TLg9PK1haQG6gwTFYFUttxBP1o+sKAAVUJMpo
	2h1zeVjLC2sLiw2eIpBWcRV9x54IwLVv/prf6X7CQWD1S81ffqB2RfULdkKRA5I0
	FkqvgukgRk1z52jMCrsUhJZnobvrdB1V/AXTg4+0mFmsTr5EzDZ387QRgUcQqp7N
	ZoA==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	messagingengine.com; h=cc:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to:x-me-proxy
	:x-me-proxy:x-me-sender:x-me-sender:x-sasl-enc; s=fm3; bh=dTrAyS
	nNi0NIl1s1zYFvalJ4njaRevDPGuETAGi4TWo=; b=ALteTJNyEJPpozNG6ml3JM
	OBI4awmmIgM+I8IYMmInthAqpqEC3viieS76oynqoBTS0DTA3M0nAqKVdmdlNceE
	ZKm1SnXtMbl5IEkQUCMhSwHx7xQ0XCMFTtey7/skWxzZUmzmOsjsQJLB6ZoXPE8t
	g2/rHH2wUDjX7Obuiq3RRKb60N0bQWMT6XVbI6jZ6lAh+RmlruAfh4Npr5pmZKBP
	K2Lq9kKHk+tmwTyjLd7uW/7vt+kEvnzLlg+Wt2FbGEZiVuFvj7u8eVudVe7Cfvte
	kleLvpE+dT/eCy9fse0X4UCr61MZ8OQXE9HC6uajVfNZuhcGU0DUzd4SxcCabiUw
	==
X-ME-Sender: <xms:As87YXFmZlSgXfEJMODQCMKy11OOOLRbfHfmHCGZZ-WUWzyaJzMyZA>
    <xme:As87YUVAxaXFm2roLh5SAJSnp_JqRQzKZ8x8ckGy-YKDTvRipzCcLHDl1vhCcvZEF
    yrqOcld6IVRi_Hwe4Q>
X-ME-Received: <xmr:As87YZKzttmGpyxJtG2YqViKjW2Yf26-h532uxwnbVVwEuN5B06gvFLYWUfcny9ki2bmUQ2m8vfW6c2x3rbMuPUQ81-SKg>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgedvtddrudeguddgudeitdcutefuodetggdotefrod
    ftvfcurfhrohhfihhlvgemucfhrghsthforghilhdpqfgfvfdpuffrtefokffrpgfnqfgh
    necuuegrihhlohhuthemuceftddtnecusecvtfgvtghiphhivghnthhsucdlqddutddtmd
    enucfjughrpeffhffvuffkfhggtggujgesthdtredttddtvdenucfhrhhomheplfhoshhh
    ucfvrhhiphhlvghtthcuoehjohhshhesjhhoshhhthhrihhplhgvthhtrdhorhhgqeenuc
    ggtffrrghtthgvrhhnpefhudevleelteehveejveeffeelfeetjeetheelvdejvdehjeev
    leevjeefteevtdenucffohhmrghinheplhifnhdrnhgvthenucevlhhushhtvghrufhiii
    gvpedtnecurfgrrhgrmhepmhgrihhlfhhrohhmpehjohhshhesjhhoshhhthhrihhplhgv
    thhtrdhorhhg
X-ME-Proxy: <xmx:As87YVENm0MzpfAvmWB0ZEhvg-bgb5NsbWzJGbefnkFsNJ7lTZ53GQ>
    <xmx:As87YdU169eKaQ8v6lEHVVGGDhUeN9oRhKeXaHHB9xPuEPosaWL_Ow>
    <xmx:As87YQPmxRiBEEi_pHk_YZw-e_4EoDkViPZB289T0L-U5V75kcEEoA>
    <xmx:A887Yefwe1QCj-5zNJLVeMhXPVw5UCYy__IM1rFDg-TUg4ZjBhho2Q>
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Fri,
 10 Sep 2021 17:32:49 -0400 (EDT)
Date: Fri, 10 Sep 2021 14:32:48 -0700
From: Josh Triplett <josh@joshtriplett.org>
To: Jonathan Corbet <corbet@lwn.net>
Cc: ksummit@lists.linux.dev
Subject: Re: [MAINTAINER SUMMIT] User-space requirements for accelerator
 drivers
Message-ID: <YTvPAMT9FRCUeWjR@localhost>
References: <877dfop2lx.fsf@meer.lwn.net>
Precedence: bulk
X-Mailing-List: ksummit@lists.linux.dev
List-Id: <ksummit.lists.linux.dev>
List-Subscribe: <mailto:ksummit+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:ksummit+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <877dfop2lx.fsf@meer.lwn.net>

On Fri, Sep 10, 2021 at 03:00:58PM -0600, Jonathan Corbet wrote:
> There has been a regular disagreement in recent years about whether
> drivers for accelerators (such as for the Habana Gaudi device) should be
> subject to the same requirements as GPU drivers when it comes to the
> availability of a free implementation of the user-space side.  It flared
> up again recently:
> 
>    https://lwn.net/Articles/867168/
> 
> Happily, the Habana situation in particular seems to be resolving
> itself:
> 
>    https://lwn.net/ml/linux-kernel/CAFCwf119s7iXk+qpwoVPnRtOGcxeuZb3rnihf6NWWoVT-4ODHA@mail.gmail.com/
> 
> But even there it is clear that the fundamental question has not yet
> been resolved.
> 
> This seems like the sort of question that the maintainer summit exists
> to address.  Specifically, we could discuss:
> 
>  - Under which circumstances should the kernel community require the
>    existence of freely licensed user-space code that exercises all
>    functionalities of a proposed kernel driver or feature?

I think it'd be reasonable to ask, as well: if we required this for
*all* kernel functionality, such that we never add any userspace
interface to the kernel unless there's *some* Open Source userspace that
needs/wants it, what problems would that cause if any?

It appears that in this case the kernel pushing back has influenced the
release of Open Source userspace code. Having a kernel-wide policy here
seems like it'll *help* people within many companies to push for such
changes: "We're never going to be able to get our changes into the
upstream kernel if there's no userspace to drive them."

One tradeoff would be, in theory, that there are some vendors who won't
care enough about upstreaming their changes, and will just keep their
drivers out of tree in that circumstance. There was a time where that
would have been reason enough not to have such a policy. I think that
time has passed, though, and now I think we'd get more benefit from
requiring open userspace consumers of APIs than we'd lose by having some
APIs not submitted upstream. (Plus, those vendors are still obligated to
*ship* the source of those changes to their users, and if a third party
wants to use those changes they can always upstream them, at which point
the vendor still faces the choice of "do I want/need to participate in
this conversation or not".)

>  - What constitutes an acceptable user-space implementation in cases
>    where these restrictions apply?

This seems like it'll always be a fuzzy line. The main issue: it's OK if
there are both open and proprietary users, but it's not OK if the only
open implementation is an outdated or token project that nobody actually
uses, that exists and is maintained solely for the purposes of placating
the kernel requirement. There's no easy way to define that line, other
than "we'll know it when we see it".

