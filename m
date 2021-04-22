Return-Path: <ksummit+bounces-76-lists=lfdr.de@lists.linux.dev>
X-Original-To: lists@lfdr.de
Delivered-To: lists@lfdr.de
Received: from sjc.edge.kernel.org (sjc.edge.kernel.org [IPv6:2604:1380:1000:8100::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 768F73681C8
	for <lists@lfdr.de>; Thu, 22 Apr 2021 15:48:09 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sjc.edge.kernel.org (Postfix) with ESMTPS id 3A99B3E647A
	for <lists@lfdr.de>; Thu, 22 Apr 2021 13:48:08 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 526F72FA1;
	Thu, 22 Apr 2021 13:48:01 +0000 (UTC)
X-Original-To: ksummit@lists.linux.dev
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 682D02F9B
	for <ksummit@lists.linux.dev>; Thu, 22 Apr 2021 13:48:00 +0000 (UTC)
Received: by mail.kernel.org (Postfix) with ESMTPSA id 3227E600D1;
	Thu, 22 Apr 2021 13:47:58 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1619099280;
	bh=FSYQFuGU17plA3qllHCpDz+rIiwGGUV/2r4WDFBHFnM=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=h9b0WJzJcyw3kJGRZ6DCivO9nT8g+qEUVhdkB7IDxbwyJnui1U6W7+1edIwcHMKAZ
	 RTPPxmgu9IYV6IOpdh95kf4VmRYNZrAC6nVIYoRpSyqnC2uK3RUYWyLZ9fD5bnD+cV
	 Cxzr2uBIu+Exs2ZfUy2ca5ekFsXtt8LnwmLMN5WiMzu7lsZ66cUJWWBXBsiDCno0us
	 Hwvfi7t+0TlvILHyAa3UN1RjC+kTUxRcqPVUe20ruRqjmu82nJt9IkBUBtn2EQEtXf
	 mQTKRmtmhuu8+4ygazV+aYzJcb4TeVF02iZUuIn5Cdq/5eqH0eWoPvHVsTy7nyu/Nv
	 Wn5ofkpGuN5fQ==
Date: Thu, 22 Apr 2021 16:47:56 +0300
From: Leon Romanovsky <leon@kernel.org>
To: Mark Brown <broonie@kernel.org>
Cc: Mauro Carvalho Chehab <mchehab@kernel.org>,
	James Bottomley <James.Bottomley@hansenpartnership.com>,
	ksummit@lists.linux.dev
Subject: Re: [MAINTAINER SUMMIT] Rethinking the acceptance policy for
 "trivial" patches
Message-ID: <YIF+jDPl8aoqHu2K@unreal>
References: <afc5664dc2b60f912dd97abfa818b3f7c4237b92.camel@HansenPartnership.com>
 <YID5xhy2vv45fnOv@unreal>
 <20210422112001.22c64fe9@coco.lan>
 <YIFfXTVMDmHwVmSR@unreal>
 <20210422132202.GE4572@sirena.org.uk>
X-Mailing-List: ksummit@lists.linux.dev
List-Id: <ksummit.lists.linux.dev>
List-Subscribe: <mailto:ksummit+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:ksummit+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable
In-Reply-To: <20210422132202.GE4572@sirena.org.uk>

On Thu, Apr 22, 2021 at 02:22:02PM +0100, Mark Brown wrote:
> On Thu, Apr 22, 2021 at 02:34:53PM +0300, Leon Romanovsky wrote:
>=20
> > Like Christoph said, if it is unrelated send the patches as separated
> > series.
>=20
> A very common case is for MFDs where you've got a core driver which is
> either being newly added or as far as external interfaces go having some
> defines added to it and then a bunch of basically unrelated driver
> patches.  There is often a build time dependency (not so much with the
> newly added stuff) so there is an actual dependency but no meaningful
> overlap with reviews.  You get a similar thing with people bringing up
> new SoCs where they send a minimal set of drivers in the initial series
> so people can usefully test.

I don't know anything about MFD subsystem, but for the subsystems (netdev, =
RDMA, PCI and MM)
which I'm following, is important to get whole series.

Thanks

