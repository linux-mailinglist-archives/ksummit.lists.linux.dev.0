Return-Path: <ksummit+bounces-1195-lists=lfdr.de@lists.linux.dev>
X-Original-To: lists@lfdr.de
Delivered-To: lists@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 2A6387E2B68
	for <lists@lfdr.de>; Mon,  6 Nov 2023 18:45:10 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 484951C20D97
	for <lists@lfdr.de>; Mon,  6 Nov 2023 17:45:09 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 2266C2C856;
	Mon,  6 Nov 2023 17:45:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.b="V4BqjtUm"
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 504C82C840;
	Mon,  6 Nov 2023 17:45:04 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 9F3B0C433C8;
	Mon,  6 Nov 2023 17:45:04 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=linuxfoundation.org;
	s=korg; t=1699292704;
	bh=iWBR4jZ3kCnJ05Ym7IzAR3AfUGVcsCYqTVSsVE1OaR8=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=V4BqjtUm8JSOEl62g/wBKDkHY4rjyp2TM7NF9Csr8jbqDwkRop+PSffLmIjnRQ598
	 ZbRXgDzEoWpf6ehQA1X7AeX1uJNDCzO+PXlvJTe5R1t+TEEC38cKkFXLBvKYBf2c5+
	 pwJJtzRerv2fnuAozc0ez0MJzGEyq7MCeBBD9vhI=
Date: Mon, 6 Nov 2023 12:45:03 -0500
From: Konstantin Ryabitsev <konstantin@linuxfoundation.org>
To: Miquel Raynal <miquel.raynal@bootlin.com>
Cc: Steven Rostedt <rostedt@goodmis.org>, users@linux.kernel.org, 
	ksummit@lists.linux.dev
Subject: Re: [workflows]RFC: switching "THE REST" in MAINTAINERS away from
 linux-kernel@vger.kernel.org
Message-ID: <20231106-ambitious-grinning-grebe-eeafcf@meerkat>
References: <20231106-venomous-raccoon-of-wealth-acc57c@nitro>
 <20231106110547.6956a430@gandalf.local.home>
 <20231106172932.01bce954@xps-13>
Precedence: bulk
X-Mailing-List: ksummit@lists.linux.dev
List-Id: <ksummit.lists.linux.dev>
List-Subscribe: <mailto:ksummit+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:ksummit+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20231106172932.01bce954@xps-13>

On Mon, Nov 06, 2023 at 05:29:32PM +0100, Miquel Raynal wrote:
> > > For this reason, I propose switching the "F: *" entry in MAINTAINERS 
> > > ("THE REST") to patches@lists.linux.dev instead. This list differs from LKML
> > > in the following important aspects:  
> > 
> > As long as it doesn't affect those that have L: linux-kernel@vger.kernel.org
> > 
> > All core kernel changes should still go there.
> > 
> >  (Scheduler, timing, tracing, interrupts, etc)
> 
> There are many MAINTAINERS entries without explicit mailing-list which
> are not really 'core kernel' areas. If we consider
> patches@lists.linux.dev as an archive-only list, then
> maybe get_maintainers.pl should somehow fallback to
> linux-kernel@vger.kernel.org anyway when no list pops-up?

I'm happy if we disambiguate between "THE REST" and "ALWAYS CC" behaviours. If
"THE REST" only triggers when there are no matching L: entries, and "ALWAYS
CC" gets added on all mail regardless, that would achieve the same result that
I'm looking for.

-K

