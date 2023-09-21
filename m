Return-Path: <ksummit+bounces-1185-lists=lfdr.de@lists.linux.dev>
X-Original-To: lists@lfdr.de
Delivered-To: lists@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [147.75.48.161])
	by mail.lfdr.de (Postfix) with ESMTPS id ED9117A9470
	for <lists@lfdr.de>; Thu, 21 Sep 2023 14:56:42 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id B4C74B2085D
	for <lists@lfdr.de>; Thu, 21 Sep 2023 12:56:39 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 3A435B654;
	Thu, 21 Sep 2023 12:56:22 +0000 (UTC)
X-Original-To: ksummit@lists.linux.dev
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com [213.167.242.64])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A7E8AB641
	for <ksummit@lists.linux.dev>; Thu, 21 Sep 2023 12:56:19 +0000 (UTC)
Received: from pendragon.ideasonboard.com (213-243-189-158.bb.dnainternet.fi [213.243.189.158])
	by perceval.ideasonboard.com (Postfix) with ESMTPSA id 46E571257;
	Thu, 21 Sep 2023 14:54:40 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
	s=mail; t=1695300880;
	bh=Ei6hR9vDGYgzL3M8aX7IWsjS03xnZscXnCcKmq16dXY=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=Uzgkq4hhzt5lQmvbswnG/oo8fZ5E/KFdvfp8xzBQNMzc6T7NUGCPfEI/+JHiBemcz
	 sD/J8AwG7VS9PWTLjgTiK5df8MDhrPVOiTyX+Rgn+QsTJ//h05Gbg+Yoo3wzpuAFJq
	 CyflYVbujL135CzpRJW5VmoEYoxjF0BFWD9+7sxc=
Date: Thu, 21 Sep 2023 15:56:28 +0300
From: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
To: Linus Walleij <linus.walleij@linaro.org>
Cc: Shuah <shuah@kernel.org>, Steven Rostedt <rostedt@goodmis.org>,
	Bart Van Assche <bvanassche@acm.org>,
	James Bottomley <James.Bottomley@hansenpartnership.com>,
	ksummit@lists.linux.dev,
	tech-board-discuss@lists.linux-foundation.org
Subject: Re: [MAINTAINERS SUMMIT] Maintainers Support Group
Message-ID: <20230921125628.GE27722@pendragon.ideasonboard.com>
References: <20230919121001.7bc610d4@gandalf.local.home>
 <dbeb5ad9-fa6d-4633-a160-6a0f8ed6bd51@acm.org>
 <20230919132112.19b700df@gandalf.local.home>
 <496f0b46-1a40-af25-ac1a-d4e7f1a8aad0@kernel.org>
 <20230919192148.1010cc74@gandalf.local.home>
 <57b53325-3c40-641e-30de-5755650960f8@kernel.org>
 <20230920225441.GA12561@pendragon.ideasonboard.com>
 <CACRpkdY1bg13hbM6k_Em1A_wMZSaHOnrvv7J=FRK3e9z4HbN-g@mail.gmail.com>
Precedence: bulk
X-Mailing-List: ksummit@lists.linux.dev
List-Id: <ksummit.lists.linux.dev>
List-Subscribe: <mailto:ksummit+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:ksummit+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <CACRpkdY1bg13hbM6k_Em1A_wMZSaHOnrvv7J=FRK3e9z4HbN-g@mail.gmail.com>

On Thu, Sep 21, 2023 at 02:40:07PM +0200, Linus Walleij wrote:
> On Thu, Sep 21, 2023 at 12:54 AM Laurent Pinchart wrote:
> 
> > I wonder if I'm stating the obvious, but trying to figure out ways to
> > handle psychological problems in a group made of software developers
> > seems like we will be fairly short on essential skills for this kind of
> > exercise. Given the size of the affected community, I think we could
> > find ways to get professional help.
> 
> Yes, can Linux Foundation help?
> 
> (Actually I have a bachelor degree in the behavioral sciences
> but I guess it's not common.)

It would be nice if it was more common :-) Without asking all
maintainers and developers to get a new bachelor, maybe targetted
trainings could also help ?

-- 
Regards,

Laurent Pinchart

