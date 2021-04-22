Return-Path: <ksummit+bounces-32-lists=lfdr.de@lists.linux.dev>
X-Original-To: lists@lfdr.de
Delivered-To: lists@lfdr.de
Received: from ewr.edge.kernel.org (ewr.edge.kernel.org [IPv6:2604:1380:1:3600::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 4D77236799D
	for <lists@lfdr.de>; Thu, 22 Apr 2021 08:02:02 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ewr.edge.kernel.org (Postfix) with ESMTPS id 6F5341C2D74
	for <lists@lfdr.de>; Thu, 22 Apr 2021 06:00:46 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 6E1372FA2;
	Thu, 22 Apr 2021 06:00:37 +0000 (UTC)
X-Original-To: ksummit@lists.linux.dev
Received: from casper.infradead.org (casper.infradead.org [90.155.50.34])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A357A2F9B
	for <ksummit@lists.linux.dev>; Thu, 22 Apr 2021 06:00:33 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=casper.20170209; h=In-Reply-To:Content-Type:MIME-Version:
	References:Message-ID:Subject:Cc:To:From:Date:Sender:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description;
	bh=AlqzyhDQ4JKWXNRvnxM1Dw0PsLVo8M9cSDkMlNnueME=; b=j4xBJBbHZaneeH4VtzQHX3OkVN
	8RwlTnW1wn40KS8wSYwr2wz+r1/DmkxG1LSCncfasBDEyBvRBiQn/ftSpfSzRxj6T7GrcpkQF6Vqe
	yNmk9mZfDq3FyQRBZgkQGkAbX++inRY56KZViHRnNcDotyQW6BTN/KPC21ShpGffrOqMxiD/B7n3m
	cYjzBPh25rApxe57EtHqnkZZoqubyvOiLVYRjLyOcB23Tq72PjCrBOeQ/bRggOXp22UVvguUcihst
	KV/eSG9Gu2z2wLh4F7kurXHpVc5NHQgsWkfHkDHPBG7k1CODpU6s43jlMyIF1ttOOeDIjg8OZcTJx
	VqpkxEog==;
Received: from hch by casper.infradead.org with local (Exim 4.94 #2 (Red Hat Linux))
	id 1lZSNQ-00HVOH-OZ; Thu, 22 Apr 2021 06:00:01 +0000
Date: Thu, 22 Apr 2021 06:59:48 +0100
From: Christoph Hellwig <hch@infradead.org>
To: Roland Dreier <roland@kernel.org>
Cc: Steven Rostedt <rostedt@goodmis.org>,
	James Bottomley <James.Bottomley@hansenpartnership.com>,
	ksummit@lists.linux.dev
Subject: Re: [MAINTAINER SUMMIT] Rethinking the acceptance policy for
 "trivial" patches
Message-ID: <20210422055948.GA4171859@infradead.org>
References: <afc5664dc2b60f912dd97abfa818b3f7c4237b92.camel@HansenPartnership.com>
 <20210421152209.68075314@gandalf.local.home>
 <CAG4TOxNOHRexUoKTo7ndViNtss0_BDeh4YCVHexvdQhQWF+vaw@mail.gmail.com>
X-Mailing-List: ksummit@lists.linux.dev
List-Id: <ksummit.lists.linux.dev>
List-Subscribe: <mailto:ksummit+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:ksummit+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <CAG4TOxNOHRexUoKTo7ndViNtss0_BDeh4YCVHexvdQhQWF+vaw@mail.gmail.com>
X-SRS-Rewrite: SMTP reverse-path rewritten from <hch@infradead.org> by casper.infradead.org. See http://www.infradead.org/rpr.html

On Wed, Apr 21, 2021 at 12:32:33PM -0700, Roland Dreier wrote:
> I also think there does need to be a strong sanction against this UMN
> research group, since we need to make sure there are strong incentives
> against wasting everyone's time with stunts like this.  Hopefully on
> the academic side it can be made clear that this is not ethical
> research - for example, why did IEEE think this was an acceptable
> paper?

I wholeheartedly disagree.  Demonstrating this kind of "attack" has
been long overdue, and kicked off a very important discussion.  Even
more so as in this area malice is almost indistinguishable from normal
incompetence.  I think they deserve a medel of honor.

