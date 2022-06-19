Return-Path: <ksummit+bounces-659-lists=lfdr.de@lists.linux.dev>
X-Original-To: lists@lfdr.de
Delivered-To: lists@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 6516C5508D6
	for <lists@lfdr.de>; Sun, 19 Jun 2022 08:14:22 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 23E02280A9E
	for <lists@lfdr.de>; Sun, 19 Jun 2022 06:14:21 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 5EA8D390;
	Sun, 19 Jun 2022 06:14:14 +0000 (UTC)
X-Original-To: ksummit@lists.linux.dev
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5D9EE7B
	for <ksummit@lists.linux.dev>; Sun, 19 Jun 2022 06:14:09 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=bombadil.20210309; h=In-Reply-To:Content-Type:MIME-Version
	:References:Message-ID:Subject:Cc:To:From:Date:Sender:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description;
	bh=xxHbe2nz0yzLQaJtQRwpNORmauX0ZMgk81/v5gP+S58=; b=KruKbeeFR4YOkIU/ix/CzKYfF6
	3nGW9NLTNsMNv078FoLudLQENwD/eKDemEtYYuFkEFqeUkHI1AL5v+mbRIkKtbbRvmJ9OzougitlY
	+L/17w6C5PLNjNJtu7nQWG4byhu/CEdSAtWI0KmFUXQP3ILGjMf4NapS7dpWRI6vxG79hrNgPvyf/
	IXhORNevI2Ec1jjH1qA2haK6r5fVzxpJxiHXnLmHljcr7+uZLYbst0UAEPSW+If27TUGIGJiawAQt
	NUGJEY3GCJTJq/mnnZcBk85tT02mL5hbuA0srGf3HeevSUlYE/JVBTrJUexMD5Ex+3p2HGZL5x5P/
	BuDjg9rw==;
Received: from hch by bombadil.infradead.org with local (Exim 4.94.2 #2 (Red Hat Linux))
	id 1o2oC7-00DKl5-Vf; Sun, 19 Jun 2022 06:14:00 +0000
Date: Sat, 18 Jun 2022 23:13:59 -0700
From: Christoph Hellwig <hch@infradead.org>
To: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
Cc: Miguel Ojeda <miguel.ojeda.sandonis@gmail.com>,
	ksummit <ksummit-discuss@lists.linuxfoundation.org>,
	ksummit@lists.linux.dev
Subject: Re: [TECH TOPIC] Rust
Message-ID: <Yq6+p+aRCjeZ7QsS@infradead.org>
References: <CANiq72nNKvFqQs9Euy=_McfcHf0-dC_oPB3r8ZJii2L3sfVjaw@mail.gmail.com>
 <Yq44nyu7P1uhBVGi@pendragon.ideasonboard.com>
Precedence: bulk
X-Mailing-List: ksummit@lists.linux.dev
List-Id: <ksummit.lists.linux.dev>
List-Subscribe: <mailto:ksummit+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:ksummit+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <Yq44nyu7P1uhBVGi@pendragon.ideasonboard.com>
X-SRS-Rewrite: SMTP reverse-path rewritten from <hch@infradead.org> by bombadil.infradead.org. See http://www.infradead.org/rpr.html

On Sat, Jun 18, 2022 at 11:42:07PM +0300, Laurent Pinchart wrote:
> All previous topics but this one are technical. To restore the balance a
> bit (and also because I believe it's important to the success of this
> project :-)), I'd like to also discuss the impact on the kernel
> maintenance at large, beyond just the maintainers who opt in to be early
> adopters of rust in their subsystem.

Yes.  That is I think the most important point.

I've played around with rust a bit for userspace project, and there is
things I like a lot like strict type safety and the ownership model, and
things I detest like verbose and unlogic syntax, the cargo cult of
vendoring libraries instead of a sane shared library and versioning
model (althought that should be largerly irrelevant for the kernel),
and compared to many other languages it seems overall rather sane.

But I'm really worried about the impact on the kernel, as interface
between languages are a real pain, and so far I'm not convinced at
all that this pain is worth the gain, even if that could change in
the future.  It doesn't help that the showcase seems to be binder,
code that should have been in userspace from the start.

Btw, a lot of these aspects also apply to the whole drivers in eBPF
discussion.

