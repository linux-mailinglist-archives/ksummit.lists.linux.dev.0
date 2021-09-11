Return-Path: <ksummit+bounces-519-lists=lfdr.de@lists.linux.dev>
X-Original-To: lists@lfdr.de
Delivered-To: lists@lfdr.de
Received: from ewr.edge.kernel.org (ewr.edge.kernel.org [IPv6:2604:1380:1:3600::1])
	by mail.lfdr.de (Postfix) with ESMTPS id A4029407AB0
	for <lists@lfdr.de>; Sun, 12 Sep 2021 00:34:07 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ewr.edge.kernel.org (Postfix) with ESMTPS id A521F1C0FA7
	for <lists@lfdr.de>; Sat, 11 Sep 2021 22:34:06 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 2A54B3FDA;
	Sat, 11 Sep 2021 22:33:59 +0000 (UTC)
X-Original-To: ksummit@lists.linux.dev
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 12F623FC3
	for <ksummit@lists.linux.dev>; Sat, 11 Sep 2021 22:33:57 +0000 (UTC)
Received: by mail.kernel.org (Postfix) with ESMTPSA id C7C3E61027;
	Sat, 11 Sep 2021 22:33:56 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1631399637;
	bh=hRtETW+0GFz3vGTafDNlr3sHSo7Ua0VAl1M3slW4zw4=;
	h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
	b=jHSCx51cgE3D2826TzGrYujkYsaiuTdo0JnyDz/Gd5DCw0Viml6Pe0CcihuZPxiyJ
	 TtM1oQijWybwbGj7AjsfkCw/em5TJLN7TkVD/maGWM4eg0x64bqY8YBDApwOPKZQ9m
	 po/zZZFmCiKK0KVFM8p3gcYcL2Q+h7ZpmSr4hJkxXEQLkORvDKV6TgY/rkOeRyPHI3
	 B9gRecmAyFSAT7OkVPSQYHRZAlxzmz+rnfaPwvhmiepKJQ/HA7zUXiFyKfS02wGekB
	 khYWC6EfppYCoDWtdMEZRazBggmkAoidfMhB3G8to4dCtuU4ekHIrITpeoo9ku11ls
	 HTHRZ7vpFyikg==
Date: Sun, 12 Sep 2021 00:33:49 +0200
From: Mauro Carvalho Chehab <mchehab@kernel.org>
To: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
Cc: Jonathan Corbet <corbet@lwn.net>, ksummit@lists.linux.dev
Subject: Re: [MAINTAINER SUMMIT] User-space requirements for accelerator
 drivers
Message-ID: <20210912003349.6d2cacb1@coco.lan>
In-Reply-To: <YTx2iShbdcrY4SMk@pendragon.ideasonboard.com>
References: <877dfop2lx.fsf@meer.lwn.net>
	<20210911005214.71b55ac6@coco.lan>
	<YTvuYmqLESpGvXD7@pendragon.ideasonboard.com>
	<20210911023811.74b82f10@coco.lan>
	<YTx2iShbdcrY4SMk@pendragon.ideasonboard.com>
X-Mailer: Claws Mail 4.0.0 (GTK+ 3.24.30; x86_64-redhat-linux-gnu)
Precedence: bulk
X-Mailing-List: ksummit@lists.linux.dev
List-Id: <ksummit.lists.linux.dev>
List-Subscribe: <mailto:ksummit+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:ksummit+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit

Em Sat, 11 Sep 2021 12:27:37 +0300
Laurent Pinchart <laurent.pinchart@ideasonboard.com> escreveu:

> Hi Mauro,

> > > > On media, enforcing userspace to always be open source would
> > > > have been very bad, as it would prevent several videoconferencing 
> > > > software to exist on Linux.    
> > > 
> > > Could you elaborate on which software you're thinking of ? And maybe
> > > which driver(s) you're thinking about ?  
> > 
> > I'm referring to tools like v4l2-compliance, qv4l2 and other tools
> > we maintain at v4l-utils tree.  
> 
> I meant the video conferencing software that would have been prevented
> from existing. I'd like to understand if you think that requiring *one*
> open userspace would be problematic.

No, requiring *one* open userspace real application should be enough.

> > Yeah, a public datasheet sounds an interesting requirement. It offers
> > a problem, though: maybe some details could be missed on it, which
> > would prevent any real open source userspace development.  
> 
> Absolutely, and I don't think we can come up with any process and
> technical measure that would prevent a vendor from cheating if they
> really want to. It will always be possible to hide some features behind
> reserved registers that wouldn't need to be programmed for basic
> operation but that would be crucial to optimize the quality or
> performances. This is regardless of whether we want to enforce openness
> of documentation in the form of datasheets or source code.

Unfortunately true.

> I'm not too concerned about this though. If we can address most of this
> issue with a clear process and message I think it would be a very good
> step forward already.

Yeah, a policy could be implemented in order to address such cases,
asking the vendor for a fix or even removing drivers and banning
vendors that are, by purpose, sending broken drivers/APIs.

Thanks,
Mauro

