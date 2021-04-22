Return-Path: <ksummit+bounces-61-lists=lfdr.de@lists.linux.dev>
X-Original-To: lists@lfdr.de
Delivered-To: lists@lfdr.de
Received: from sjc.edge.kernel.org (sjc.edge.kernel.org [IPv6:2604:1380:1000:8100::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 7F24E36808D
	for <lists@lfdr.de>; Thu, 22 Apr 2021 14:35:26 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sjc.edge.kernel.org (Postfix) with ESMTPS id EF6423E582A
	for <lists@lfdr.de>; Thu, 22 Apr 2021 12:35:23 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 192FF2FA1;
	Thu, 22 Apr 2021 12:35:17 +0000 (UTC)
X-Original-To: ksummit@lists.linux.dev
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2574C2F9B
	for <ksummit@lists.linux.dev>; Thu, 22 Apr 2021 12:35:16 +0000 (UTC)
Received: by mail.kernel.org (Postfix) with ESMTPSA id C2E4961452;
	Thu, 22 Apr 2021 12:35:14 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1619094915;
	bh=RpFnu/MT5IUT21nZGUkXROIih71OZLcFaAboaR4FHsA=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=ojaiYSSxY5WaBl12IXNNi5y2b7pkKK51gfz15+MeCArdKVV0rGO7V+8x1zMjMmPAM
	 XZkpd1kiMTjSAiN8+SostbrDjrjWZX/txHXUok+G+qArZwZR025/6KQMBrus+jNeAM
	 cW9pFbwKapVLD0tpFlZRAetKUdZVQUSgOKKDuIVMDChDVlLMYPrvaliwA08hnn932H
	 p8Ut+tCIlXO1UaFdbGYqRyp4Zk3Z9qrAl9H2dzwwaqWBAkBf/OORJMdM4oiddvGXzd
	 uRtKfhHILXRqhJk/RsHu97TIR1/j2+cX7LZZfy/uTXhAQMhTgK3gJ5gVXVtzvlqvrJ
	 ZhymJLux9OVLw==
Date: Thu, 22 Apr 2021 15:35:11 +0300
From: Leon Romanovsky <leon@kernel.org>
To: Mark Brown <broonie@kernel.org>
Cc: Mauro Carvalho Chehab <mchehab@kernel.org>,
	Geert Uytterhoeven <geert@linux-m68k.org>,
	James Morris <jmorris@namei.org>,
	Julia Lawall <julia.lawall@inria.fr>,
	Stephen Hemminger <stephen@networkplumber.org>,
	Roland Dreier <roland@kernel.org>,
	Steven Rostedt <rostedt@goodmis.org>,
	James Bottomley <James.Bottomley@hansenpartnership.com>,
	ksummit@lists.linux.dev
Subject: Re: [MAINTAINER SUMMIT] Rethinking the acceptance policy for
 "trivial" patches
Message-ID: <YIFtf+1Oj7oJn/43@unreal>
References: <20210421152209.68075314@gandalf.local.home>
 <CAG4TOxNOHRexUoKTo7ndViNtss0_BDeh4YCVHexvdQhQWF+vaw@mail.gmail.com>
 <alpine.DEB.2.22.394.2104212150230.20674@hadrien>
 <20210421132824.13a70f6c@hermes.local>
 <alpine.DEB.2.22.394.2104212233450.20674@hadrien>
 <d95ee281-4dc0-c5c1-ec87-81d83f44979@namei.org>
 <CAMuHMdU=c2bY1_sq+rSh1fON5QhNx8xWqMQLT+cD0BpqG0RtCg@mail.gmail.com>
 <20210422115511.60d1f735@coco.lan>
 <YIFlo6TSE1n6tD6K@unreal>
 <20210422122604.GC4572@sirena.org.uk>
X-Mailing-List: ksummit@lists.linux.dev
List-Id: <ksummit.lists.linux.dev>
List-Subscribe: <mailto:ksummit+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:ksummit+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable
In-Reply-To: <20210422122604.GC4572@sirena.org.uk>

On Thu, Apr 22, 2021 at 01:26:04PM +0100, Mark Brown wrote:
> On Thu, Apr 22, 2021 at 03:01:39PM +0300, Leon Romanovsky wrote:
> > On Thu, Apr 22, 2021 at 11:55:11AM +0200, Mauro Carvalho Chehab wrote:
>=20
> > > The reverted ones for media (29 patches) didn't contain any malicious=
 code.
> > > One was useless (because the media core already fixes the pointed iss=
ue),
> > > but the other ones were valid patches.
>=20
> > And didn't you ask yourself after seeing same 29 patches that the
> > correct fix should be in another place? pm_runtime_get_sync?
>=20
> The runtime PM APIs are for legitimate reasons really fiddly to get
> right - there's a bunch of different ways to do things and disabling
> runtime PM in Kconfig can cause surprises.  It's been identified as an
> issue for years but it's really not trivial to address it at the API
> level.

There is no need to fix all problems at once, but seeing same mistake
over and over like in commit 57cc666d36ad ("media: st-delta: Fix reference
count leak in delta_run_work") can be fixed very easily (+grep all source
code to remove extra put):

diff --git a/drivers/base/power/runtime.c b/drivers/base/power/runtime.c
index 18b82427d0cb..d73c967ddb80 100644
--- a/drivers/base/power/runtime.c
+++ b/drivers/base/power/runtime.c
@@ -1089,6 +1089,9 @@ int __pm_runtime_resume(struct device *dev, int rpmfl=
ags)
        retval =3D rpm_resume(dev, rpmflags);
        spin_unlock_irqrestore(&dev->power.lock, flags);

+       if (retval && rpmflags & RPM_GET_PUT)
+               atomic_dec(&dev->power.usage_count);
+
        return retval;
 }
 EXPORT_SYMBOL_GPL(__pm_runtime_resume);




