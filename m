Return-Path: <ksummit+bounces-86-lists=lfdr.de@lists.linux.dev>
X-Original-To: lists@lfdr.de
Delivered-To: lists@lfdr.de
Received: from ewr.edge.kernel.org (ewr.edge.kernel.org [147.75.197.195])
	by mail.lfdr.de (Postfix) with ESMTPS id B09343682D8
	for <lists@lfdr.de>; Thu, 22 Apr 2021 16:57:10 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ewr.edge.kernel.org (Postfix) with ESMTPS id F03141C5E61
	for <lists@lfdr.de>; Thu, 22 Apr 2021 14:57:09 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id EC2682FA0;
	Thu, 22 Apr 2021 14:57:02 +0000 (UTC)
X-Original-To: ksummit@lists.linux.dev
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com [213.167.242.64])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3967970
	for <ksummit@lists.linux.dev>; Thu, 22 Apr 2021 14:57:01 +0000 (UTC)
Received: from pendragon.ideasonboard.com (62-78-145-57.bb.dnainternet.fi [62.78.145.57])
	by perceval.ideasonboard.com (Postfix) with ESMTPSA id 2BBC93EE;
	Thu, 22 Apr 2021 16:51:28 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
	s=mail; t=1619103088;
	bh=D1GpBOeWIGYhUkIwsi8+wZTjqQ6FdE008bms/uUjAm0=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=NeM51YoGOIyrHyculEtYtTk6Nngu2y6uxDj8u71GJkDhomtrDEDKRb4YnntcC0FQ7
	 /Zs5U8Qz5jU5nIY3KpfnXI5WRAhKxpPWPbT3nSC8KUndbboMyksKFWd2gmjMTyiks4
	 huomU/QnRB30LAcP6+Cl7v8m/AOcDvdZZnNIwna8=
Date: Thu, 22 Apr 2021 17:51:23 +0300
From: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
To: Mike Rapoport <rppt@linux.ibm.com>
Cc: Mark Brown <broonie@kernel.org>, Leon Romanovsky <leon@kernel.org>,
	James Bottomley <James.Bottomley@hansenpartnership.com>,
	ksummit@lists.linux.dev
Subject: Re: [MAINTAINER SUMMIT] Rethinking the acceptance policy for
 "trivial" patches
Message-ID: <YIGNa8iAoJSFmkT1@pendragon.ideasonboard.com>
References: <afc5664dc2b60f912dd97abfa818b3f7c4237b92.camel@HansenPartnership.com>
 <YID5xhy2vv45fnOv@unreal>
 <20210422124023.GD4572@sirena.org.uk>
 <YIFx/iorjncjslob@linux.ibm.com>
X-Mailing-List: ksummit@lists.linux.dev
List-Id: <ksummit.lists.linux.dev>
List-Subscribe: <mailto:ksummit+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:ksummit+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <YIFx/iorjncjslob@linux.ibm.com>

On Thu, Apr 22, 2021 at 03:54:22PM +0300, Mike Rapoport wrote:
> On Thu, Apr 22, 2021 at 01:40:23PM +0100, Mark Brown wrote:
> > On Thu, Apr 22, 2021 at 07:21:26AM +0300, Leon Romanovsky wrote:
> > 
> > > While we are talking about policies, I would like to raise another bad
> > > practice that is done by even seasoned developers - sending patches with
> > > carefully crafted and filtered TO and CC.
> > 
> > > This practice causes to get out of context patches without ability to
> > > see whole picture and the worse part that it divides feedback to
> > > "islands" without ability to agree or disagree with the feedback.
> > 
> > The flip side of copying everyone on everything is that especially for
> > serieses which aren't just repetitive changes this gets really noisy
> > really quickly and things end up just not getting read.
> 
> I think this is quite subjective and different people have different email
> flows.
> 
> For me the most annoying is to get several patches from the middle of a
> series. IMHO, sending at least cover letter to everyone is the bare minimum
> so that people at least can take a look at high level details and request a
> repost.

Could tooling based on lore and b4 help here ? The prospect of getting
more patches in my inbox isn't exactly enticing, but the ability to
quickly get the full context of a patch series is certainly useful (I've
had to look up parts I wasn't CC'ed on previously).

-- 
Regards,

Laurent Pinchart

