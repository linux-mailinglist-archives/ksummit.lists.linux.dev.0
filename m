Return-Path: <ksummit+bounces-81-lists=lfdr.de@lists.linux.dev>
X-Original-To: lists@lfdr.de
Delivered-To: lists@lfdr.de
Received: from sjc.edge.kernel.org (sjc.edge.kernel.org [147.75.69.165])
	by mail.lfdr.de (Postfix) with ESMTPS id 4880236823D
	for <lists@lfdr.de>; Thu, 22 Apr 2021 16:12:21 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sjc.edge.kernel.org (Postfix) with ESMTPS id 0CF013E67F0
	for <lists@lfdr.de>; Thu, 22 Apr 2021 14:12:20 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 1BFDF2FA1;
	Thu, 22 Apr 2021 14:12:13 +0000 (UTC)
X-Original-To: ksummit@lists.linux.dev
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2F1AE2F9B
	for <ksummit@lists.linux.dev>; Thu, 22 Apr 2021 14:12:12 +0000 (UTC)
Received: by mail.kernel.org (Postfix) with ESMTPSA id 6971460FDB;
	Thu, 22 Apr 2021 14:12:10 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1619100731;
	bh=Q07R+eRPkCqvD4rXcSRNboEM1UmVi5B/3sler0W3uzs=;
	h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
	b=kIAhHOYf1BTGx6l3lL9+3wQ5V6ypmlT0gfVOXi/OdU0xGxVeSYKgkY8bL6PM/v5P5
	 Vv8ABcolX3JF/WGcxSmGGZRSewcxxoMz9WRW22vmvUP13LRjBN293Zt72Bt23hkqwu
	 e8q8J0IE3eBnpb/KeDMUzzkcOC1TqAlwW4eFJqtx2rzdmys+iKXh9ihLN1CVHy7Hf4
	 oaCnfzVe6Ks66uH55TLrSB9O4xz3rPE0cDHkOjMPI3L3o4+2gHgOwmeaNNHDaZnYKG
	 6jPNK/VeBPeyFIQBb5fWIAMTj0abWbv8Lpmiv4/hmEgNZrgZvoZ0/71MRUkJlLE62t
	 FiF2l6M1ngZKA==
Date: Thu, 22 Apr 2021 16:12:07 +0200
From: Mauro Carvalho Chehab <mchehab@kernel.org>
To: Mark Brown <broonie@kernel.org>
Cc: Leon Romanovsky <leon@kernel.org>, James Bottomley
 <James.Bottomley@hansenpartnership.com>, ksummit@lists.linux.dev
Subject: Re: [MAINTAINER SUMMIT] Rethinking the acceptance policy for
 "trivial" patches
Message-ID: <20210422161207.3350a36e@coco.lan>
In-Reply-To: <20210422132202.GE4572@sirena.org.uk>
References: <afc5664dc2b60f912dd97abfa818b3f7c4237b92.camel@HansenPartnership.com>
	<YID5xhy2vv45fnOv@unreal>
	<20210422112001.22c64fe9@coco.lan>
	<YIFfXTVMDmHwVmSR@unreal>
	<20210422132202.GE4572@sirena.org.uk>
X-Mailer: Claws Mail 3.17.8 (GTK+ 2.24.33; x86_64-redhat-linux-gnu)
X-Mailing-List: ksummit@lists.linux.dev
List-Id: <ksummit.lists.linux.dev>
List-Subscribe: <mailto:ksummit+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:ksummit+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit

Em Thu, 22 Apr 2021 14:22:02 +0100
Mark Brown <broonie@kernel.org> escreveu:

> On Thu, Apr 22, 2021 at 02:34:53PM +0300, Leon Romanovsky wrote:
> 
> > Like Christoph said, if it is unrelated send the patches as separated
> > series.  
> 
> A very common case is for MFDs where you've got a core driver which is
> either being newly added or as far as external interfaces go having some
> defines added to it and then a bunch of basically unrelated driver
> patches.  There is often a build time dependency (not so much with the
> newly added stuff) so there is an actual dependency but no meaningful
> overlap with reviews.  You get a similar thing with people bringing up
> new SoCs where they send a minimal set of drivers in the initial series
> so people can usefully test.

Another common case are patches changing a kAPI that it is used on
other subsystems. They should be grouped as a hole, and applied
altogether, but each subsystem maintainer should ack/review only the
stuff related to the subsystem's scope.

Btw, one such example is the /190 patch series from the UNM reverts
that actually generated this thread: it doesn't make any sense to
bother all subsystem maintainers for patches that are completely
unrelated to their work.

Thanks,
Mauro

