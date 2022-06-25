Return-Path: <ksummit+bounces-717-lists=lfdr.de@lists.linux.dev>
X-Original-To: lists@lfdr.de
Delivered-To: lists@lfdr.de
Received: from da.mirrors.kernel.org (da.mirrors.kernel.org [139.178.84.19])
	by mail.lfdr.de (Postfix) with ESMTPS id 3483A55ABD2
	for <lists@lfdr.de>; Sat, 25 Jun 2022 19:49:34 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by da.mirrors.kernel.org (Postfix) with ESMTPS id B32D82E0A6A
	for <lists@lfdr.de>; Sat, 25 Jun 2022 17:49:32 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 7C73A291B;
	Sat, 25 Jun 2022 17:49:23 +0000 (UTC)
X-Original-To: ksummit@lists.linux.dev
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com [213.167.242.64])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 392B7290B
	for <ksummit@lists.linux.dev>; Sat, 25 Jun 2022 17:49:20 +0000 (UTC)
Received: from pendragon.ideasonboard.com (62-78-145-57.bb.dnainternet.fi [62.78.145.57])
	by perceval.ideasonboard.com (Postfix) with ESMTPSA id EC8A131A;
	Sat, 25 Jun 2022 19:49:12 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
	s=mail; t=1656179353;
	bh=PhEVFog9mljAehcUh9ztFuUtg1sTv8nY0EuiMKmssQw=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=j0LIZHA8DouRHk3Yr1H+a2KpPC4TwffGUtrp72ojSZcz5tQQqNVOa9yISVQlh153I
	 mzDVzIAwgDFBI8c3azyOhuywD5BXVb6wLswRV4btFhgJsPjledFHLfEDWZhjfGsZ97
	 SxgxLgn7HiLHw/2sw/eaEb+8ToanutQfRRsbNcms=
Date: Sat, 25 Jun 2022 20:48:55 +0300
From: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
To: Steven Rostedt <rostedt@goodmis.org>
Cc: Jonathan Corbet <corbet@lwn.net>,
	ksummit-discuss@lists.linuxfoundation.org, ksummit@lists.linux.dev
Subject: Re: [TECH TOPIC] What kernel documentation could be
Message-ID: <YrdKhw8gww20ODYr@pendragon.ideasonboard.com>
References: <87sfo3nh3t.fsf@meer.lwn.net>
 <20220625134328.19b5356c@rorschach.local.home>
Precedence: bulk
X-Mailing-List: ksummit@lists.linux.dev
List-Id: <ksummit.lists.linux.dev>
List-Subscribe: <mailto:ksummit+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:ksummit+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20220625134328.19b5356c@rorschach.local.home>

Hi Steven,

On Sat, Jun 25, 2022 at 01:43:28PM -0400, Steven Rostedt wrote:
> On Fri, 17 Jun 2022 14:57:10 -0600 Jonathan Corbet wrote:
> 
> > The development community has put a lot of work into the kernel's
> > documentation directory in recent years, with visible results. But the
> > kernel's documentation still falls far short of the standard set by many
> > other projects, and there is a great deal of "tribal knowledge" in our
> > community that is not set down. I'd like to look at the successes and
> > failures of the work so far, but intent to focus on a discussion of what
> > our documentation should be and what we can do to get it there.
> > 
> > Questions to discuss include:
> > 
> >  - Bringing an coherent overall structure to Documentation/
> > 
> >  - Making it easier for developers to improve the documentation.
> 
> Is there a way to mark comments in the code as "design docs". And I
> don't mean the kernel-doc that is already above functions.
> 
> I have lots of comments about the design of complex code just above the
> code it is describing. Which is much more likely to get updated when
> the design changes or gets new features.
> 
> I found my design documents I have under Documentation to become
> grossly obsolete over time, where as the comments above the code I can
> keep up with.
> 
> Is there already some kind of mark up that we can add to the comments to state:
> 
>  ** .design.trace/ftrace.rst .ringbuffer. **
> 
> or something that can be extracted into another document? With the
> above example, I could have in Documentatino/trace/ftrace.rst a
> 
>  .design .ringbuffer.
> 
> And the comment from the code would be extracted into the html
> documents that are created?
> 
> Or maybe it would be better to reference the code from the documentation?
> 
>  .include kerne/trace/ring_buffer.c .ringbuffer.
> 
> That will look for a tag in kernel/trace/ring_buffer.c called
> ".ringbuffer" and pull in the comment into the document under Documentation.
> 
> Thoughts?

See the "DOC: overview" block in drivers/gpu/drm/drm_atomic_helper.c,
and how it is integrated in Documentation/gpu/drm-kms-helpers.rst with

.. kernel-doc:: drivers/gpu/drm/drm_atomic_helper.c
   :doc: overview

Is that what you're looking for ?

> >  - What we would like from Sphinx and what we can do to make it happen
> > 
> >  - Making the docs build system less ugly and more maintainable
> > 
> >  - Integrating rustdoc documentation

-- 
Regards,

Laurent Pinchart

