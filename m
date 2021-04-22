Return-Path: <ksummit+bounces-45-lists=lfdr.de@lists.linux.dev>
X-Original-To: lists@lfdr.de
Delivered-To: lists@lfdr.de
Received: from sjc.edge.kernel.org (sjc.edge.kernel.org [IPv6:2604:1380:1000:8100::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 386E9367D97
	for <lists@lfdr.de>; Thu, 22 Apr 2021 11:20:41 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sjc.edge.kernel.org (Postfix) with ESMTPS id 837283E454F
	for <lists@lfdr.de>; Thu, 22 Apr 2021 09:20:16 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id F2E582FA1;
	Thu, 22 Apr 2021 09:20:07 +0000 (UTC)
X-Original-To: ksummit@lists.linux.dev
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EEA2871
	for <ksummit@lists.linux.dev>; Thu, 22 Apr 2021 09:20:06 +0000 (UTC)
Received: by mail.kernel.org (Postfix) with ESMTPSA id 0D20861445;
	Thu, 22 Apr 2021 09:20:04 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1619083206;
	bh=3wg42OWW3GLxX4h0KHko/G+ddIFjcbyYURMdge88CEw=;
	h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
	b=Xe8DONiDk2Ikma/7bjworbUKcmpSxqik6pB/eLWwycCQUkL+uR4EeRWH5ZykY+/kp
	 ETpZMpkwY+rt0yMT0fV41eDD8iiiNd/2q+dIiW9Xh4IiBQUSA70eh+LZ4O+3eNsf8q
	 gDt6CYJz7WKREjJEAY9tn48b2k4aRWG4qYtZHNp7ULZX5IS9pLNHPOqz4J2XlqgZ+O
	 HGy4toN+VwN/EEP+nepH6vRME8FQ80C//KB1qSPjEIpvW+4LsS+wK1ZxUZHi2sCUkA
	 V5Y0M1w8AbOg7cw4WGGOwlBaVJ4PrBacvyscbFY9Im9NyfBUIuVmYlVG2jW8bhnjy4
	 JIvw9j3XFLaVg==
Date: Thu, 22 Apr 2021 11:20:01 +0200
From: Mauro Carvalho Chehab <mchehab@kernel.org>
To: Leon Romanovsky <leon@kernel.org>
Cc: James Bottomley <James.Bottomley@hansenpartnership.com>,
 ksummit@lists.linux.dev
Subject: Re: [MAINTAINER SUMMIT] Rethinking the acceptance policy for
 "trivial" patches
Message-ID: <20210422112001.22c64fe9@coco.lan>
In-Reply-To: <YID5xhy2vv45fnOv@unreal>
References: <afc5664dc2b60f912dd97abfa818b3f7c4237b92.camel@HansenPartnership.com>
	<YID5xhy2vv45fnOv@unreal>
X-Mailer: Claws Mail 3.17.8 (GTK+ 2.24.33; x86_64-redhat-linux-gnu)
X-Mailing-List: ksummit@lists.linux.dev
List-Id: <ksummit.lists.linux.dev>
List-Subscribe: <mailto:ksummit+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:ksummit+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit

Em Thu, 22 Apr 2021 07:21:26 +0300
Leon Romanovsky <leon@kernel.org> escreveu:

> On Wed, Apr 21, 2021 at 11:35:36AM -0700, James Bottomley wrote:
> > I've long been on record as not really being a fan of trivial patches
> > because they can cause merge issues with current patches and introduce
> > bugs, particularly in older drivers, that don't get detected for a long
> > while.  However, the recent events with the University of Minnesota:
> > 
> > https://lore.kernel.org/lkml/20210421130105.1226686-1-gregkh@linuxfoundation.org/
> > 
> > Have elevated the risk factor around trivial patches claiming to fix
> > bugs to the point where it looks like there's no such thing as a truly
> > trivial patch and they all need reviewing.  
> 
> While we are talking about policies, I would like to raise another bad
> practice that is done by even seasoned developers - sending patches with
> carefully crafted and filtered TO and CC.
> 
> This practice causes to get out of context patches without ability to
> see whole picture and the worse part that it divides feedback to
> "islands" without ability to agree or disagree with the feedback.
> 
> I'm putting this link as an EXAMPLE where every patch has different CC participants:
> https://lore.kernel.org/linux-rdma/CAJX1Ytb=XYKGeYuEN-2tPv9hx3G+=wnGWMzPk893J__JJFyhGQ@mail.gmail.com/T/#mf56c926ec0279a65fe180110b7dcf93fe053b91a

This is not a matter of bad practice. There are a couple of reasons
why each patch on a series will have a different group of Cc, like:

	- driver maintainers for each patch may be different;
	- scripts/get_maintainers.pl will return a different Cc/To;
	- patch series touch different subsystems;
	- sending a patch with too many c/c can make it rejected by
	  mail list servers.

Also, nowadays, with lore and b4, it would be easy to retrieve the
entire patch series, even for those that aren't subscribed on a 
c/c mailing list.

Thanks,
Mauro

