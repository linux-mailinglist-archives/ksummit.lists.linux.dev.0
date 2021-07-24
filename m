Return-Path: <ksummit+bounces-450-lists=lfdr.de@lists.linux.dev>
X-Original-To: lists@lfdr.de
Delivered-To: lists@lfdr.de
Received: from ewr.edge.kernel.org (ewr.edge.kernel.org [IPv6:2604:1380:1:3600::1])
	by mail.lfdr.de (Postfix) with ESMTPS id D50D93D4AA1
	for <lists@lfdr.de>; Sun, 25 Jul 2021 01:19:17 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ewr.edge.kernel.org (Postfix) with ESMTPS id 7CE2E1C05D0
	for <lists@lfdr.de>; Sat, 24 Jul 2021 23:19:16 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 7B0A62FB6;
	Sat, 24 Jul 2021 23:19:09 +0000 (UTC)
X-Original-To: ksummit@lists.linux.dev
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com [213.167.242.64])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D21A4168
	for <ksummit@lists.linux.dev>; Sat, 24 Jul 2021 23:19:07 +0000 (UTC)
Received: from pendragon.ideasonboard.com (62-78-145-57.bb.dnainternet.fi [62.78.145.57])
	by perceval.ideasonboard.com (Postfix) with ESMTPSA id 0D59C255;
	Sun, 25 Jul 2021 01:18:59 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
	s=mail; t=1627168740;
	bh=rMBCWou0fhJbmjzHoQNiKk2qnR2gpbKg7obxIhu21fc=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=iDop85nh9uPLjNq2SSMLLlOdgU11uHzKKqdn5sbVo8LVhDlYkgSrTr6qdIyLPNjU6
	 ojjD7+YTiU8X8zUMmKuI1JIU8NdnLBuW1ssEBhIjPxuwx1m93ljJ+eZcjbmYrIVrmf
	 2XlFS1jzbuQ+pW55NSgBe2+PBaPZEI4ip6tJ39CE=
Date: Sun, 25 Jul 2021 02:18:56 +0300
From: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
To: Geert Uytterhoeven <geert@linux-m68k.org>
Cc: Dan Carpenter <dan.carpenter@oracle.com>, ksummit@lists.linux.dev,
	Julia Lawall <julia.lawall@inria.fr>
Subject: Re: Potential static analysis ideas
Message-ID: <YPyf4NkpONFhrbuw@pendragon.ideasonboard.com>
References: <20210723191023.GG25548@kadam>
 <CAMuHMdWwSdXppWo=sYm+ajVdR=zXzNJpP2xZWbCLdxxu55MZoA@mail.gmail.com>
Precedence: bulk
X-Mailing-List: ksummit@lists.linux.dev
List-Id: <ksummit.lists.linux.dev>
List-Subscribe: <mailto:ksummit+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:ksummit+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <CAMuHMdWwSdXppWo=sYm+ajVdR=zXzNJpP2xZWbCLdxxu55MZoA@mail.gmail.com>

On Sat, Jul 24, 2021 at 03:33:48PM +0200, Geert Uytterhoeven wrote:
> On Fri, Jul 23, 2021 at 9:11 PM Dan Carpenter wrote:
> > These days we have disabled GCC's uninitialized warnings so it falls
> > to static analysis devs to review all the new warnings.  I sometimes
> > ignore warnings if they look like probably they aren't a bug.  Does this
> > function allow zero size writes?  Does this switch statement really need
> > a default case?  Maybe sometimes I miss bugs.
> 
> Yeah, I tended to find a few real bugs every release using the good old
> gcc 4.2, before support for it was dropped.
> I hope someone still runs modern compilers with GCC's uninitialized
> warnings enabled again?
> 
> > Here is another example of something which I have a check for but I
> > haven't pushed.
> >
> >         ret = frob();
> >         if (!ret)
> >                 return ret;
> >
> > This code is normally correct but sometimes it means the if statement is
> > reversed and it should be "if (ret) return ret;".  To me returning a
> > literal is always more clear but but clearly the original author felt
> > "ret" was more clear...  It's only a few bugs per year so it's not a big
> > deal either way.
> 
> To make it work well, you need to know if frob() and/or the current
> function return an error code or not.  While you can use some heuristics
> (e.g. is there any return -Exxx), perhaps we can add an annotation to
> indicate if a function returns an error code, or an error pointer?

https://lore.kernel.org/linux-media/YNMvarFl%2FKU1pGCG@pendragon.ideasonboard.com/

I think it would be useful, if not for the tools, at least for
developers.

-- 
Regards,

Laurent Pinchart

