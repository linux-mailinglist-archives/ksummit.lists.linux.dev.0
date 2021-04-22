Return-Path: <ksummit+bounces-34-lists=lfdr.de@lists.linux.dev>
X-Original-To: lists@lfdr.de
Delivered-To: lists@lfdr.de
Received: from ewr.edge.kernel.org (ewr.edge.kernel.org [IPv6:2604:1380:1:3600::1])
	by mail.lfdr.de (Postfix) with ESMTPS id DB1D43679A8
	for <lists@lfdr.de>; Thu, 22 Apr 2021 08:06:29 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ewr.edge.kernel.org (Postfix) with ESMTPS id D740E1C3033
	for <lists@lfdr.de>; Thu, 22 Apr 2021 06:06:28 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 0F3082FA2;
	Thu, 22 Apr 2021 06:06:20 +0000 (UTC)
X-Original-To: ksummit@lists.linux.dev
Received: from casper.infradead.org (casper.infradead.org [90.155.50.34])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5D9C22F9B
	for <ksummit@lists.linux.dev>; Thu, 22 Apr 2021 06:06:17 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=casper.20170209; h=In-Reply-To:Content-Type:MIME-Version:
	References:Message-ID:Subject:Cc:To:From:Date:Sender:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description;
	bh=R89Ye6H5Czgi/yAOaJ6z/NPvHUV9892EBcULshunr6c=; b=tY3OKz+1ACHwao5CRy03q7ydxt
	3taY1DTvFYjWQvBBdHfIFjaCFxIIwlCIeCk8z4jQWQU5MJMwBEaFhVezrqQvEbj0P2TAvHaVU7f+I
	9hwvTyuGAjJAkCd3NR/uo/M3V0PKcxMTwDvm9BZ4Kmukn0GO8mGusq7f5GQztbKjuzJ7e5EwXJZ1K
	TPB+fYka7K5mw1VMEq24DAn8ZlQvBonH0yeJpFZ+bdM7Agj5+Kms+1OMSYt4LK0AceRWF14aKaYUC
	hQNt5o93AZnpL19bj/Kn1Zp1F4XXXY3z2qYLMFR/VyKcPBZ4L3qfIvV549Clgh+oMYEw6GFsXUqeP
	aQKbeADg==;
Received: from hch by casper.infradead.org with local (Exim 4.94 #2 (Red Hat Linux))
	id 1lZSSw-00HVjp-DX; Thu, 22 Apr 2021 06:05:47 +0000
Date: Thu, 22 Apr 2021 07:05:30 +0100
From: Christoph Hellwig <hch@infradead.org>
To: Al Viro <viro@zeniv.linux.org.uk>
Cc: Leon Romanovsky <leon@kernel.org>,
	James Bottomley <James.Bottomley@hansenpartnership.com>,
	ksummit@lists.linux.dev
Subject: Re: [MAINTAINER SUMMIT] Rethinking the acceptance policy for
 "trivial" patches
Message-ID: <20210422060530.GC4171859@infradead.org>
References: <afc5664dc2b60f912dd97abfa818b3f7c4237b92.camel@HansenPartnership.com>
 <YID5xhy2vv45fnOv@unreal>
 <YIEB/Azk3cGD8osf@zeniv-ca.linux.org.uk>
X-Mailing-List: ksummit@lists.linux.dev
List-Id: <ksummit.lists.linux.dev>
List-Subscribe: <mailto:ksummit+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:ksummit+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <YIEB/Azk3cGD8osf@zeniv-ca.linux.org.uk>
X-SRS-Rewrite: SMTP reverse-path rewritten from <hch@infradead.org> by casper.infradead.org. See http://www.infradead.org/rpr.html

On Thu, Apr 22, 2021 at 04:56:28AM +0000, Al Viro wrote:
> > This practice causes to get out of context patches without ability to
> > see whole picture and the worse part that it divides feedback to
> > "islands" without ability to agree or disagree with the feedback.
> 
> Suppose you have a 60-patch series, with 56 in fs/*.c (and related headers
> in include/linux) and 4 - in arch/*/include/asm/*; should e.g. MIPS folks
> get spammed with the entire thing, just because one patch consolidates
> some ifdefs?

If it is all related: absolutly.  If no just split it into two or more
series.


