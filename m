Return-Path: <ksummit+bounces-28-lists=lfdr.de@lists.linux.dev>
X-Original-To: lists@lfdr.de
Delivered-To: lists@lfdr.de
Received: from sjc.edge.kernel.org (sjc.edge.kernel.org [147.75.69.165])
	by mail.lfdr.de (Postfix) with ESMTPS id A49ED367875
	for <lists@lfdr.de>; Thu, 22 Apr 2021 06:21:43 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sjc.edge.kernel.org (Postfix) with ESMTPS id 920BE3E2FF3
	for <lists@lfdr.de>; Thu, 22 Apr 2021 04:21:40 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id AC34C2FA1;
	Thu, 22 Apr 2021 04:21:31 +0000 (UTC)
X-Original-To: ksummit@lists.linux.dev
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B4B532F81
	for <ksummit@lists.linux.dev>; Thu, 22 Apr 2021 04:21:30 +0000 (UTC)
Received: by mail.kernel.org (Postfix) with ESMTPSA id 7741561002;
	Thu, 22 Apr 2021 04:21:29 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1619065290;
	bh=5wUp95Us6EHtbivXDS+SrE3St5h6GR9Hch5A1vj+X24=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=U2hL9AS/J4jfZbqTPbtbQ/xPVbIrMQO1TqQV9EuJZEzQDi8P1OqxparYmJ3ysxTna
	 vn236DWlTyyThawGrlUNrkZin6uv5J9nJZferf8SlQ3RMyMGqvTlzT39yBR3lHmTuT
	 TMvfzp19n74lUdJ59uYkapjcypYSWfInKRN6wTXQsNIbxcRGhBEatOihc7yLo3No4i
	 kaoSus/Jg+fKPVvVCI1Hd1NDxww+LkCMTKMOUsnz6JbfPevKSAtzxnbKTOCqLGYobF
	 EmUXnsPr4z/yG2oR+FmF1REilycEXJtk+NNDO4CxlvOxcgKlr9ueknwazszNPrQY2S
	 sXql5buY34rIQ==
Date: Thu, 22 Apr 2021 07:21:26 +0300
From: Leon Romanovsky <leon@kernel.org>
To: James Bottomley <James.Bottomley@hansenpartnership.com>
Cc: ksummit@lists.linux.dev
Subject: Re: [MAINTAINER SUMMIT] Rethinking the acceptance policy for
 "trivial" patches
Message-ID: <YID5xhy2vv45fnOv@unreal>
References: <afc5664dc2b60f912dd97abfa818b3f7c4237b92.camel@HansenPartnership.com>
X-Mailing-List: ksummit@lists.linux.dev
List-Id: <ksummit.lists.linux.dev>
List-Subscribe: <mailto:ksummit+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:ksummit+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <afc5664dc2b60f912dd97abfa818b3f7c4237b92.camel@HansenPartnership.com>

On Wed, Apr 21, 2021 at 11:35:36AM -0700, James Bottomley wrote:
> I've long been on record as not really being a fan of trivial patches
> because they can cause merge issues with current patches and introduce
> bugs, particularly in older drivers, that don't get detected for a long
> while.  However, the recent events with the University of Minnesota:
> 
> https://lore.kernel.org/lkml/20210421130105.1226686-1-gregkh@linuxfoundation.org/
> 
> Have elevated the risk factor around trivial patches claiming to fix
> bugs to the point where it looks like there's no such thing as a truly
> trivial patch and they all need reviewing.

While we are talking about policies, I would like to raise another bad
practice that is done by even seasoned developers - sending patches with
carefully crafted and filtered TO and CC.

This practice causes to get out of context patches without ability to
see whole picture and the worse part that it divides feedback to
"islands" without ability to agree or disagree with the feedback.

I'm putting this link as an EXAMPLE where every patch has different CC participants:
https://lore.kernel.org/linux-rdma/CAJX1Ytb=XYKGeYuEN-2tPv9hx3G+=wnGWMzPk893J__JJFyhGQ@mail.gmail.com/T/#mf56c926ec0279a65fe180110b7dcf93fe053b91a

Thanks

