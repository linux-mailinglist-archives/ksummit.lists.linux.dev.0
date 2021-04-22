Return-Path: <ksummit+bounces-46-lists=lfdr.de@lists.linux.dev>
X-Original-To: lists@lfdr.de
Delivered-To: lists@lfdr.de
Received: from ewr.edge.kernel.org (ewr.edge.kernel.org [147.75.197.195])
	by mail.lfdr.de (Postfix) with ESMTPS id 8A247367DC3
	for <lists@lfdr.de>; Thu, 22 Apr 2021 11:34:19 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ewr.edge.kernel.org (Postfix) with ESMTPS id BBF001C3C8A
	for <lists@lfdr.de>; Thu, 22 Apr 2021 09:34:18 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 18A752FA1;
	Thu, 22 Apr 2021 09:34:10 +0000 (UTC)
X-Original-To: ksummit@lists.linux.dev
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3674271
	for <ksummit@lists.linux.dev>; Thu, 22 Apr 2021 09:34:09 +0000 (UTC)
Received: by mail.kernel.org (Postfix) with ESMTPSA id 4767B613D8;
	Thu, 22 Apr 2021 09:34:07 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1619084048;
	bh=3LPVyLK0vgQEgaC991QSXENegFx0rDrG1qK4xuvxYj8=;
	h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
	b=s23y3rKFO6zQdfnBr2uzZ5ez7NHogoxTdn/PJjUWwgZ1vyUdFY5JBMxZ8rGYWOzUo
	 d7/BP9wKkEozo0cLuhtumD+vUSXGjd4ntMwmgOTcpUvAOHHPo6SoKkKxBycP6fVJOA
	 ovnhRfPB6QQgq3zRnGH5drEqAno5fjxwSEfIJNamupNYszQA+7QFLnebZXi3M1u8YB
	 HDBL+VtDvpjatsjUvKE55SDMZfn5LRMKvNGe67jXjVfNJZRN1qv/lMkCIq/Tqp5yDr
	 Ln1dLLVYC664UbAFQGhMDu59AaGHFFaUKeRhtGnfmoBjzxkDBmhw5X1C9mL+sFbGrS
	 vHMn+xAhPFmLQ==
Date: Thu, 22 Apr 2021 11:34:04 +0200
From: Mauro Carvalho Chehab <mchehab@kernel.org>
To: Dan Carpenter <dan.carpenter@oracle.com>
Cc: James Bottomley <James.Bottomley@HansenPartnership.com>,
 ksummit@lists.linux.dev
Subject: Re: [MAINTAINER SUMMIT] Rethinking the acceptance policy for
 "trivial" patches
Message-ID: <20210422113404.09f35a85@coco.lan>
In-Reply-To: <20210421194702.GH1981@kadam>
References: <afc5664dc2b60f912dd97abfa818b3f7c4237b92.camel@HansenPartnership.com>
	<20210421194702.GH1981@kadam>
X-Mailer: Claws Mail 3.17.8 (GTK+ 2.24.33; x86_64-redhat-linux-gnu)
X-Mailing-List: ksummit@lists.linux.dev
List-Id: <ksummit.lists.linux.dev>
List-Subscribe: <mailto:ksummit+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:ksummit+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit

Hi Dan,

Em Wed, 21 Apr 2021 22:47:03 +0300
Dan Carpenter <dan.carpenter@oracle.com> escreveu:

> I use my rename_rev.pl script to review trivial patches.  It's kind of
> a crap script, but it's useful if someone is re-indenting a whole file
> and adds a secret additional line.
> 
> https://github.com/error27/rename_rev
> 
> Someone who isn't as terrible at Perl could probably re-write it better.

Here, I use "wdiff" in order to deal with renames. It has a somewhat
funny dialect, but it helps a lot reviewing renaming patches.


Thanks,
Mauro

