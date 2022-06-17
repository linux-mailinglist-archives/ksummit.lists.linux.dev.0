Return-Path: <ksummit+bounces-649-lists=lfdr.de@lists.linux.dev>
X-Original-To: lists@lfdr.de
Delivered-To: lists@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id D9D1054FF8C
	for <lists@lfdr.de>; Fri, 17 Jun 2022 23:55:36 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id CFC1F280BED
	for <lists@lfdr.de>; Fri, 17 Jun 2022 21:55:33 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id E77814C90;
	Fri, 17 Jun 2022 21:55:26 +0000 (UTC)
X-Original-To: ksummit@lists.linux.dev
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com [213.167.242.64])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 182234C8D
	for <ksummit@lists.linux.dev>; Fri, 17 Jun 2022 21:55:24 +0000 (UTC)
Received: from pendragon.ideasonboard.com (62-78-145-57.bb.dnainternet.fi [62.78.145.57])
	by perceval.ideasonboard.com (Postfix) with ESMTPSA id 10695268;
	Fri, 17 Jun 2022 23:48:33 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
	s=mail; t=1655502513;
	bh=wbFHPE42g5rhlpBgzr7YD2oFPGVyJO9plnlU5qXeqG4=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=WQfHFSdSwSpAyNMXXle4LVrCwQxP9pos+2a5k6+0BSEx1OIHST9nlgnJZ+LmZkt/z
	 cCt94XkA3P98EvMksGtyNJ+NRHt8PCoHSoRNIfavuvrcPxWcxI44FoC/q6Qkpiin/K
	 EXzKc6cPyrJmxo5M3RvBGzTil5r9lrKiFfLx/jhE=
Date: Sat, 18 Jun 2022 00:48:21 +0300
From: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
To: Jonathan Corbet <corbet@lwn.net>
Cc: ksummit-discuss@lists.linuxfoundation.org, ksummit@lists.linux.dev
Subject: Re: [Ksummit-discuss] [TECH TOPIC] What kernel documentation could be
Message-ID: <Yqz2pVwvyo4MFJYO@pendragon.ideasonboard.com>
References: <87sfo3nh3t.fsf@meer.lwn.net>
Precedence: bulk
X-Mailing-List: ksummit@lists.linux.dev
List-Id: <ksummit.lists.linux.dev>
List-Subscribe: <mailto:ksummit+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:ksummit+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <87sfo3nh3t.fsf@meer.lwn.net>

Hi Jon,

On Fri, Jun 17, 2022 at 02:57:10PM -0600, Jonathan Corbet wrote:
> The development community has put a lot of work into the kernel's
> documentation directory in recent years, with visible results. But the
> kernel's documentation still falls far short of the standard set by many
> other projects, and there is a great deal of "tribal knowledge" in our
> community that is not set down. I'd like to look at the successes and
> failures of the work so far, but intent to focus on a discussion of what
> our documentation should be and what we can do to get it there.
> 
> Questions to discuss include:
> 
>  - Bringing an coherent overall structure to Documentation/
> 
>  - Making it easier for developers to improve the documentation.

I've been wondering recently if it would help to have a place where we
can record documentation wishes.

It has happened quite a few times that my searches for particular pieces
of documentation in the kernel were unfruitful, or that the related
documentation left me none the wiser (one example, which is just an
example and not finger-pointing, is the runtime PM documentation in
Documentation/power/runtime_pm.rst that feels like reading a
calculus-related PHD thesis when all you want is to understand how to
add two numbers). I rarely had time to write documentation patches as a
result, and my pains were thus left unnoticed by maintainers and
developers, who may be willing to improve the documentation if they knew
that users were struggling.

>  - What we would like from Sphinx and what we can do to make it happen
> 
>  - Making the docs build system less ugly and more maintainable
> 
>  - Integrating rustdoc documentation

-- 
Regards,

Laurent Pinchart

