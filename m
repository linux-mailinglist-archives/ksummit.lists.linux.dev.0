Return-Path: <ksummit+bounces-33-lists=lfdr.de@lists.linux.dev>
X-Original-To: lists@lfdr.de
Delivered-To: lists@lfdr.de
Received: from sjc.edge.kernel.org (sjc.edge.kernel.org [147.75.69.165])
	by mail.lfdr.de (Postfix) with ESMTPS id 99DA33679AA
	for <lists@lfdr.de>; Thu, 22 Apr 2021 08:06:42 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sjc.edge.kernel.org (Postfix) with ESMTPS id 5E07C3E21AE
	for <lists@lfdr.de>; Thu, 22 Apr 2021 06:04:16 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 9CE842FA2;
	Thu, 22 Apr 2021 06:04:07 +0000 (UTC)
X-Original-To: ksummit@lists.linux.dev
Received: from casper.infradead.org (casper.infradead.org [90.155.50.34])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7DC6E2F9B
	for <ksummit@lists.linux.dev>; Thu, 22 Apr 2021 06:04:04 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=casper.20170209; h=In-Reply-To:Content-Type:MIME-Version:
	References:Message-ID:Subject:Cc:To:From:Date:Sender:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description;
	bh=8Mm81sw0AjQuTovv2lie4kyf4zwXleMy5sYkNaY3nA8=; b=R86EiKAlshxktsDSvvvy7Wo8yE
	CsEx+rXtbVZe38x+wQetK9RrXGaStxFcXFPsHnxblAM2jkO3Z3riSH2p3TzY4TjWiJIWHdL+P+x9G
	7FGfESaGT5perO0y6kUg5DrXvO8ZabRA+YvvRqy0yGwwxDOkEfNTPmjePEe7ZJk6Vinqu+LgyhCuy
	vRlo+W00hrBk7WiKc8ciDoCnUo7900NbSTC2dkg37Uww8z7aKnR1M/Pv/HHTDwyf0fD+4uWbBkWc8
	zXBHk6TvxBqaqZRHcHbUJD2wkqVP5T3ZHe8+ocPK7ZNkGMNqDoNCfAf3BwRN4u84Xa9GgGEHGZnpu
	2+OHbBJQ==;
Received: from hch by casper.infradead.org with local (Exim 4.94 #2 (Red Hat Linux))
	id 1lZSR9-00HVZn-5U; Thu, 22 Apr 2021 06:03:47 +0000
Date: Thu, 22 Apr 2021 07:03:39 +0100
From: Christoph Hellwig <hch@infradead.org>
To: Leon Romanovsky <leon@kernel.org>
Cc: James Bottomley <James.Bottomley@hansenpartnership.com>,
	ksummit@lists.linux.dev
Subject: Re: [MAINTAINER SUMMIT] Rethinking the acceptance policy for
 "trivial" patches
Message-ID: <20210422060339.GB4171859@infradead.org>
References: <afc5664dc2b60f912dd97abfa818b3f7c4237b92.camel@HansenPartnership.com>
 <YID5xhy2vv45fnOv@unreal>
X-Mailing-List: ksummit@lists.linux.dev
List-Id: <ksummit.lists.linux.dev>
List-Subscribe: <mailto:ksummit+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:ksummit+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <YID5xhy2vv45fnOv@unreal>
X-SRS-Rewrite: SMTP reverse-path rewritten from <hch@infradead.org> by casper.infradead.org. See http://www.infradead.org/rpr.html

On Thu, Apr 22, 2021 at 07:21:26AM +0300, Leon Romanovsky wrote:
> While we are talking about policies, I would like to raise another bad
> practice that is done by even seasoned developers - sending patches with
> carefully crafted and filtered TO and CC.
> 
> This practice causes to get out of context patches without ability to
> see whole picture and the worse part that it divides feedback to
> "islands" without ability to agree or disagree with the feedback.

Yes.  Depending on my mood I'll ask for a proper resend or will just
ignore that kind of crap, as it is completely unreviewable.

