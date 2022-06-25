Return-Path: <ksummit+bounces-716-lists=lfdr.de@lists.linux.dev>
X-Original-To: lists@lfdr.de
Delivered-To: lists@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 1BC0B55ABCB
	for <lists@lfdr.de>; Sat, 25 Jun 2022 19:43:41 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id CC608280C4B
	for <lists@lfdr.de>; Sat, 25 Jun 2022 17:43:39 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id B192A2911;
	Sat, 25 Jun 2022 17:43:31 +0000 (UTC)
X-Original-To: ksummit@lists.linux.dev
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 671EF290B
	for <ksummit@lists.linux.dev>; Sat, 25 Jun 2022 17:43:30 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id B1C53C3411C;
	Sat, 25 Jun 2022 17:43:29 +0000 (UTC)
Date: Sat, 25 Jun 2022 13:43:28 -0400
From: Steven Rostedt <rostedt@goodmis.org>
To: Jonathan Corbet <corbet@lwn.net>
Cc: ksummit-discuss@lists.linuxfoundation.org, ksummit@lists.linux.dev
Subject: Re: [TECH TOPIC] What kernel documentation could be
Message-ID: <20220625134328.19b5356c@rorschach.local.home>
In-Reply-To: <87sfo3nh3t.fsf@meer.lwn.net>
References: <87sfo3nh3t.fsf@meer.lwn.net>
X-Mailer: Claws Mail 3.17.8 (GTK+ 2.24.33; x86_64-pc-linux-gnu)
Precedence: bulk
X-Mailing-List: ksummit@lists.linux.dev
List-Id: <ksummit.lists.linux.dev>
List-Subscribe: <mailto:ksummit+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:ksummit+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit

On Fri, 17 Jun 2022 14:57:10 -0600
Jonathan Corbet <corbet@lwn.net> wrote:

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


Is there a way to mark comments in the code as "design docs". And I
don't mean the kernel-doc that is already above functions.

I have lots of comments about the design of complex code just above the
code it is describing. Which is much more likely to get updated when
the design changes or gets new features.

I found my design documents I have under Documentation to become
grossly obsolete over time, where as the comments above the code I can
keep up with.

Is there already some kind of mark up that we can add to the comments to state:

 ** .design.trace/ftrace.rst .ringbuffer. **

or something that can be extracted into another document? With the
above example, I could have in Documentatino/trace/ftrace.rst a

 .design .ringbuffer.

And the comment from the code would be extracted into the html
documents that are created?

Or maybe it would be better to reference the code from the documentation?

 .include kerne/trace/ring_buffer.c .ringbuffer.

That will look for a tag in kernel/trace/ring_buffer.c called
".ringbuffer" and pull in the comment into the document under Documentation.

Thoughts?

-- Steve


> 
>  - What we would like from Sphinx and what we can do to make it happen
> 
>  - Making the docs build system less ugly and more maintainable
> 
>  - Integrating rustdoc documentation
> 
> jon


