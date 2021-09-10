Return-Path: <ksummit+bounces-500-lists=lfdr.de@lists.linux.dev>
X-Original-To: lists@lfdr.de
Delivered-To: lists@lfdr.de
Received: from ewr.edge.kernel.org (ewr.edge.kernel.org [147.75.197.195])
	by mail.lfdr.de (Postfix) with ESMTPS id 9863040739B
	for <lists@lfdr.de>; Sat, 11 Sep 2021 00:52:27 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ewr.edge.kernel.org (Postfix) with ESMTPS id AAC571C0F69
	for <lists@lfdr.de>; Fri, 10 Sep 2021 22:52:26 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 82A8C2FB6;
	Fri, 10 Sep 2021 22:52:19 +0000 (UTC)
X-Original-To: ksummit@lists.linux.dev
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5E4853FC3
	for <ksummit@lists.linux.dev>; Fri, 10 Sep 2021 22:52:18 +0000 (UTC)
Received: by mail.kernel.org (Postfix) with ESMTPSA id 81A72611AD;
	Fri, 10 Sep 2021 22:52:17 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1631314338;
	bh=s2beiB98r7q0H6aOHNISH7QyS3NuThbp8bjx2KJjrf4=;
	h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
	b=sk5hrgO+aV+vWbQaS4HhfnQonNSKQbvyTUV80rnoZFkuWrr9VgZWO13r+DJhRVDwi
	 tHk6ZEhOgfsGWMIwc5Dvl/DTAKXfSNBnzYPfSt5Ia8O8VZaWkeaQk7FHNggtGtCu0n
	 ypSd8PbWHnsW7T44/sZTECjx3EG2GGeQFpxDBCr+5UFUKXxzFeyJsCKDgWj1t/gS+M
	 4Wn1JgEqWsGPARpI/zhxEk/ORkXn9tXo2mQCmUWxWDJrY/waL5uA/uG8Gr4lpVbH66
	 jR5X93H1S/zrlNNsE5eI1ciYzAxjXoZnNOmLzV+huc97MEK67rJatJ2qkTeRuWGUr+
	 s+IjAcup6Ox1A==
Date: Sat, 11 Sep 2021 00:52:14 +0200
From: Mauro Carvalho Chehab <mchehab@kernel.org>
To: Jonathan Corbet <corbet@lwn.net>
Cc: ksummit@lists.linux.dev
Subject: Re: [MAINTAINER SUMMIT] User-space requirements for accelerator
 drivers
Message-ID: <20210911005214.71b55ac6@coco.lan>
In-Reply-To: <877dfop2lx.fsf@meer.lwn.net>
References: <877dfop2lx.fsf@meer.lwn.net>
X-Mailer: Claws Mail 4.0.0 (GTK+ 3.24.30; x86_64-redhat-linux-gnu)
Precedence: bulk
X-Mailing-List: ksummit@lists.linux.dev
List-Id: <ksummit.lists.linux.dev>
List-Subscribe: <mailto:ksummit+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:ksummit+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit

Em Fri, 10 Sep 2021 15:00:58 -0600
Jonathan Corbet <corbet@lwn.net> escreveu:

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
> 
>  - Are there internal kernel interfaces, such as DMA-BUF or P2PDMA, that
>    are only available to drivers with a free user-space implementation?
>    Do we need an EXPORT_SYMBOL_USERSPACE_GPL()?
> 
>  - What constitutes an acceptable user-space implementation in cases
>    where these restrictions apply?
> 
> I suspect that more clarity (and fewer arguments) on these questions
> would be welcome both within and beyond the development community.

The media subsystem also has this sort of issues: there are several
drivers there to support hardware accelerators for video encoders and 
decoders. In the case of media, usually devices with such hardware have
an Image Signal Processor, where the codec runs on some firmware.

On media, enforcing userspace to always be open source would
have been very bad, as it would prevent several videoconferencing 
software to exist on Linux.

Also, there are several such codec hardware that only exists on 
embedded hardware that already depends on proprietary software 
to run.

So, a policy like that would make more damage than good.

What we do, instead, is to try to enforce that the userspace API to
be fully documented in a way that open source software can exist.

This is easier said than done, but we have some compliance tools
that we use, in order to help to validate the uAPI implementations.

Thanks,
Mauro

