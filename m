Return-Path: <ksummit+bounces-35-lists=lfdr.de@lists.linux.dev>
X-Original-To: lists@lfdr.de
Delivered-To: lists@lfdr.de
Received: from sjc.edge.kernel.org (sjc.edge.kernel.org [IPv6:2604:1380:1000:8100::1])
	by mail.lfdr.de (Postfix) with ESMTPS id C38243679CB
	for <lists@lfdr.de>; Thu, 22 Apr 2021 08:19:44 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sjc.edge.kernel.org (Postfix) with ESMTPS id 420933E3771
	for <lists@lfdr.de>; Thu, 22 Apr 2021 06:19:12 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id F0EB02FA2;
	Thu, 22 Apr 2021 06:19:03 +0000 (UTC)
X-Original-To: ksummit@lists.linux.dev
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CC0912F9B
	for <ksummit@lists.linux.dev>; Thu, 22 Apr 2021 06:19:02 +0000 (UTC)
Received: by mail.kernel.org (Postfix) with ESMTPSA id A10AA6113C;
	Thu, 22 Apr 2021 06:19:01 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1619072342;
	bh=xg+fC14q9yFR2Yhq73vWHPXwCEhPX/ZTxeASizFGtJ8=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=rRemIIH/jDvl6z+DGvv0kxjpcLTjmiy1kaFX5xx9cLH8yRcS149WBi7+u8TB4cmwZ
	 pec+3k0JLKEOLCULSKMlKU6jEt/KxVXvQe5p80gYb+35oSrb4rezUf9nm6M2kDt4df
	 XMqh7bF4HhnJE1dTATLPB2gJojwDtKESJCywT+KPb9II0F3zZnEje6nmjUoc7uBTZ2
	 OCFqZig4GKlSLb/znf88iHzQqPFNfAmCQyYirpGXQjLZLjUGCb+rXLaZ0vtkfgT9gI
	 MnjQpnV5MIJTkgLLWdLyDw2kpCBYN+s6whamk3h0xWUWVkxvUhS/w7C7eKh4V5K+h5
	 UIj1WqJeDQknw==
Date: Thu, 22 Apr 2021 09:18:58 +0300
From: Leon Romanovsky <leon@kernel.org>
To: Christoph Hellwig <hch@infradead.org>
Cc: James Bottomley <James.Bottomley@hansenpartnership.com>,
	ksummit@lists.linux.dev
Subject: Re: [MAINTAINER SUMMIT] Rethinking the acceptance policy for
 "trivial" patches
Message-ID: <YIEVUpzlmVPcTi2/@unreal>
References: <afc5664dc2b60f912dd97abfa818b3f7c4237b92.camel@HansenPartnership.com>
 <YID5xhy2vv45fnOv@unreal>
 <20210422060339.GB4171859@infradead.org>
X-Mailing-List: ksummit@lists.linux.dev
List-Id: <ksummit.lists.linux.dev>
List-Subscribe: <mailto:ksummit+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:ksummit+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20210422060339.GB4171859@infradead.org>

On Thu, Apr 22, 2021 at 07:03:39AM +0100, Christoph Hellwig wrote:
> On Thu, Apr 22, 2021 at 07:21:26AM +0300, Leon Romanovsky wrote:
> > While we are talking about policies, I would like to raise another bad
> > practice that is done by even seasoned developers - sending patches with
> > carefully crafted and filtered TO and CC.
> > 
> > This practice causes to get out of context patches without ability to
> > see whole picture and the worse part that it divides feedback to
> > "islands" without ability to agree or disagree with the feedback.
> 
> Yes.  Depending on my mood I'll ask for a proper resend or will just
> ignore that kind of crap, as it is completely unreviewable.

Such ignore gives false feeling that you are OK with the changes.

Thanks

