Return-Path: <ksummit+bounces-89-lists=lfdr.de@lists.linux.dev>
X-Original-To: lists@lfdr.de
Delivered-To: lists@lfdr.de
Received: from sjc.edge.kernel.org (sjc.edge.kernel.org [147.75.69.165])
	by mail.lfdr.de (Postfix) with ESMTPS id 3D4CD36832D
	for <lists@lfdr.de>; Thu, 22 Apr 2021 17:17:27 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sjc.edge.kernel.org (Postfix) with ESMTPS id 104AE3E6EF4
	for <lists@lfdr.de>; Thu, 22 Apr 2021 15:17:26 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 500582FA0;
	Thu, 22 Apr 2021 15:17:19 +0000 (UTC)
X-Original-To: ksummit@lists.linux.dev
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com [213.167.242.64])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 11A9370
	for <ksummit@lists.linux.dev>; Thu, 22 Apr 2021 15:17:18 +0000 (UTC)
Received: from pendragon.ideasonboard.com (62-78-145-57.bb.dnainternet.fi [62.78.145.57])
	by perceval.ideasonboard.com (Postfix) with ESMTPSA id 55C83499;
	Thu, 22 Apr 2021 17:17:16 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
	s=mail; t=1619104636;
	bh=lVXmpSBrtRx0Xn9xM438b4/v290wcCt+JZmFlLjJTz8=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=kgaOrWdIAb3UwzdOarePqc1dvLYeZzcW0UCgKdupJ8WspMipZRVLOyCC3Mb4DT5zy
	 0GeLMgGmfUaI+zBq2UAZLTmeJ2Nnh8+xpf2X6/Jst3PcUAbkhcWMivP8zLIogOhYBb
	 R942BCgngJC3+P6/IB5SR8Y60lLPB2Srsc/tJYaE=
Date: Thu, 22 Apr 2021 18:17:12 +0300
From: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
To: Mike Rapoport <rppt@linux.ibm.com>
Cc: Mark Brown <broonie@kernel.org>, Leon Romanovsky <leon@kernel.org>,
	James Bottomley <James.Bottomley@hansenpartnership.com>,
	ksummit@lists.linux.dev
Subject: Re: [MAINTAINER SUMMIT] Rethinking the acceptance policy for
 "trivial" patches
Message-ID: <YIGTeIc6SyLfGyzx@pendragon.ideasonboard.com>
References: <afc5664dc2b60f912dd97abfa818b3f7c4237b92.camel@HansenPartnership.com>
 <YID5xhy2vv45fnOv@unreal>
 <20210422124023.GD4572@sirena.org.uk>
 <YIFx/iorjncjslob@linux.ibm.com>
 <YIGNa8iAoJSFmkT1@pendragon.ideasonboard.com>
 <YIGS302BVvk26p7s@linux.ibm.com>
X-Mailing-List: ksummit@lists.linux.dev
List-Id: <ksummit.lists.linux.dev>
List-Subscribe: <mailto:ksummit+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:ksummit+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <YIGS302BVvk26p7s@linux.ibm.com>

On Thu, Apr 22, 2021 at 06:14:39PM +0300, Mike Rapoport wrote:
> On Thu, Apr 22, 2021 at 05:51:23PM +0300, Laurent Pinchart wrote:
> > On Thu, Apr 22, 2021 at 03:54:22PM +0300, Mike Rapoport wrote:
> > > On Thu, Apr 22, 2021 at 01:40:23PM +0100, Mark Brown wrote:
> > > > On Thu, Apr 22, 2021 at 07:21:26AM +0300, Leon Romanovsky wrote:
> > > > 
> > > > > While we are talking about policies, I would like to raise another bad
> > > > > practice that is done by even seasoned developers - sending patches with
> > > > > carefully crafted and filtered TO and CC.
> > > > >
> > > > > This practice causes to get out of context patches without ability to
> > > > > see whole picture and the worse part that it divides feedback to
> > > > > "islands" without ability to agree or disagree with the feedback.
> > > > 
> > > > The flip side of copying everyone on everything is that especially for
> > > > serieses which aren't just repetitive changes this gets really noisy
> > > > really quickly and things end up just not getting read.
> > > 
> > > I think this is quite subjective and different people have different email
> > > flows.
> > > 
> > > For me the most annoying is to get several patches from the middle of a
> > > series. IMHO, sending at least cover letter to everyone is the bare minimum
> > > so that people at least can take a look at high level details and request a
> > > repost.
> > 
> > Could tooling based on lore and b4 help here ? The prospect of getting
> > more patches in my inbox isn't exactly enticing, but the ability to
> > quickly get the full context of a patch series is certainly useful (I've
> > had to look up parts I wasn't CC'ed on previously).
> 
> lore definitely helps, but still requires an extra step. I think having the
> cover letter in your inbox helps to decide if you want to do that extra
> step.

Agree about the cover letter, if there's something that needs to be sent
to all recipients it's that one.

-- 
Regards,

Laurent Pinchart

