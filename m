Return-Path: <ksummit+bounces-96-lists=lfdr.de@lists.linux.dev>
X-Original-To: lists@lfdr.de
Delivered-To: lists@lfdr.de
Received: from ewr.edge.kernel.org (ewr.edge.kernel.org [147.75.197.195])
	by mail.lfdr.de (Postfix) with ESMTPS id 1DBC936837C
	for <lists@lfdr.de>; Thu, 22 Apr 2021 17:38:09 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ewr.edge.kernel.org (Postfix) with ESMTPS id CB7151C4C1C
	for <lists@lfdr.de>; Thu, 22 Apr 2021 15:35:53 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 8FFBD2FA0;
	Thu, 22 Apr 2021 15:35:46 +0000 (UTC)
X-Original-To: ksummit@lists.linux.dev
Received: from zeniv-ca.linux.org.uk (zeniv-ca.linux.org.uk [142.44.231.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 07E5B70
	for <ksummit@lists.linux.dev>; Thu, 22 Apr 2021 15:35:44 +0000 (UTC)
Received: from viro by zeniv-ca.linux.org.uk with local (Exim 4.94 #2 (Red Hat Linux))
	id 1lZbMi-007O9C-D3; Thu, 22 Apr 2021 15:35:40 +0000
Date: Thu, 22 Apr 2021 15:35:40 +0000
From: Al Viro <viro@zeniv.linux.org.uk>
To: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
Cc: Mike Rapoport <rppt@linux.ibm.com>, Mark Brown <broonie@kernel.org>,
	Leon Romanovsky <leon@kernel.org>,
	James Bottomley <James.Bottomley@hansenpartnership.com>,
	ksummit@lists.linux.dev
Subject: Re: [MAINTAINER SUMMIT] Rethinking the acceptance policy for
 "trivial" patches
Message-ID: <YIGXzB0CyRtGfqfE@zeniv-ca.linux.org.uk>
References: <afc5664dc2b60f912dd97abfa818b3f7c4237b92.camel@HansenPartnership.com>
 <YID5xhy2vv45fnOv@unreal>
 <20210422124023.GD4572@sirena.org.uk>
 <YIFx/iorjncjslob@linux.ibm.com>
 <YIGNa8iAoJSFmkT1@pendragon.ideasonboard.com>
 <YIGS302BVvk26p7s@linux.ibm.com>
 <YIGTeIc6SyLfGyzx@pendragon.ideasonboard.com>
X-Mailing-List: ksummit@lists.linux.dev
List-Id: <ksummit.lists.linux.dev>
List-Subscribe: <mailto:ksummit+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:ksummit+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <YIGTeIc6SyLfGyzx@pendragon.ideasonboard.com>
Sender: Al Viro <viro@ftp.linux.org.uk>

On Thu, Apr 22, 2021 at 06:17:12PM +0300, Laurent Pinchart wrote:
> On Thu, Apr 22, 2021 at 06:14:39PM +0300, Mike Rapoport wrote:
> > On Thu, Apr 22, 2021 at 05:51:23PM +0300, Laurent Pinchart wrote:
> > > On Thu, Apr 22, 2021 at 03:54:22PM +0300, Mike Rapoport wrote:
> > > > On Thu, Apr 22, 2021 at 01:40:23PM +0100, Mark Brown wrote:
> > > > > On Thu, Apr 22, 2021 at 07:21:26AM +0300, Leon Romanovsky wrote:
> > > > > 
> > > > > > While we are talking about policies, I would like to raise another bad
> > > > > > practice that is done by even seasoned developers - sending patches with
> > > > > > carefully crafted and filtered TO and CC.
> > > > > >
> > > > > > This practice causes to get out of context patches without ability to
> > > > > > see whole picture and the worse part that it divides feedback to
> > > > > > "islands" without ability to agree or disagree with the feedback.
> > > > > 
> > > > > The flip side of copying everyone on everything is that especially for
> > > > > serieses which aren't just repetitive changes this gets really noisy
> > > > > really quickly and things end up just not getting read.
> > > > 
> > > > I think this is quite subjective and different people have different email
> > > > flows.
> > > > 
> > > > For me the most annoying is to get several patches from the middle of a
> > > > series. IMHO, sending at least cover letter to everyone is the bare minimum
> > > > so that people at least can take a look at high level details and request a
> > > > repost.
> > > 
> > > Could tooling based on lore and b4 help here ? The prospect of getting
> > > more patches in my inbox isn't exactly enticing, but the ability to
> > > quickly get the full context of a patch series is certainly useful (I've
> > > had to look up parts I wasn't CC'ed on previously).
> > 
> > lore definitely helps, but still requires an extra step. I think having the
> > cover letter in your inbox helps to decide if you want to do that extra
> > step.
> 
> Agree about the cover letter, if there's something that needs to be sent
> to all recipients it's that one.

Agreed, especially combined with "the cover latter ought to contain a reference
to git branch, if such exists".

