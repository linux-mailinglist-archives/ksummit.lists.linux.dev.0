Return-Path: <ksummit+bounces-1137-lists=lfdr.de@lists.linux.dev>
X-Original-To: lists@lfdr.de
Delivered-To: lists@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 546FE7A324D
	for <lists@lfdr.de>; Sat, 16 Sep 2023 21:44:11 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 7A88F1C20D35
	for <lists@lfdr.de>; Sat, 16 Sep 2023 19:44:10 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 462A31BDFC;
	Sat, 16 Sep 2023 19:44:02 +0000 (UTC)
X-Original-To: ksummit@lists.linux.dev
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 21E8B13AC9
	for <ksummit@lists.linux.dev>; Sat, 16 Sep 2023 19:44:01 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id E20F7C433C7;
	Sat, 16 Sep 2023 19:44:00 +0000 (UTC)
Date: Sat, 16 Sep 2023 15:44:27 -0400
From: Steven Rostedt <rostedt@goodmis.org>
To: Dave Chinner <david@fromorbit.com>
Cc: Linus Torvalds <torvalds@linux-foundation.org>, Eric Sandeen
 <sandeen@sandeen.net>, Guenter Roeck <linux@roeck-us.net>, Christoph
 Hellwig <hch@infradead.org>, ksummit@lists.linux.dev,
 linux-fsdevel@vger.kernel.org
Subject: Re: [MAINTAINERS/KERNEL SUMMIT] Trust and maintenance of file
 systems
Message-ID: <20230916154427.657bfe93@gandalf.local.home>
In-Reply-To: <ZQTfIu9OWwGnIT4b@dread.disaster.area>
References: <ZO9NK0FchtYjOuIH@infradead.org>
	<8718a8a3-1e62-0e2b-09d0-7bce3155b045@roeck-us.net>
	<ZPkDLp0jyteubQhh@dread.disaster.area>
	<20230906215327.18a45c89@gandalf.local.home>
	<ZPkz86RRLaYOkmx+@dread.disaster.area>
	<20230906225139.6ffe953c@gandalf.local.home>
	<ZPlFwHQhJS+Td6Cz@dread.disaster.area>
	<20230907071801.1d37a3c5@gandalf.local.home>
	<b7ca4a4e-a815-a1e8-3579-57ac783a66bf@sandeen.net>
	<CAHk-=wg=xY6id92yS3=B59UfKmTmOgq+NNv+cqCMZ1Yr=FwR9A@mail.gmail.com>
	<ZQTfIu9OWwGnIT4b@dread.disaster.area>
X-Mailer: Claws Mail 3.19.1 (GTK+ 2.24.33; x86_64-pc-linux-gnu)
Precedence: bulk
X-Mailing-List: ksummit@lists.linux.dev
List-Id: <ksummit.lists.linux.dev>
List-Subscribe: <mailto:ksummit+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:ksummit+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit

On Sat, 16 Sep 2023 08:48:02 +1000
Dave Chinner <david@fromorbit.com> wrote:

> >  - "they use the buffer cache".
> > 
> > Waah, waah, waah.  
> 
> .... you dismiss those concerns in the same way a 6 year old school
> yard bully taunts his suffering victims.
> 
> Regardless of the merits of the observation you've made, the tone
> and content of this response is *completely unacceptable*.  Please
> keep to technical arguments, Linus, because this sort of response
> has no merit what-so-ever. All it does is shut down the technical
> discussion because no-one wants to be the target of this sort of
> ugly abuse just for participating in a technical discussion.
> 
> Given the number of top level maintainers that signed off on the CoC
> that are present in this forum, I had an expectation that this is a
> forum where bad behaviour is not tolerated at all.  So I've waited a
> couple of days to see if anyone in a project leadership position is
> going to say something about this comment.....
> 
> <silence>
> 
> The deafening silence of tacit acceptance is far more damning than
> the high pitched squeal of Linus's childish taunts.

Being one of those that signed off on the CoC, I honestly didn't see this
until you pointed it out. As I'm not a file system maintainer I have been
mostly just skimming the emails in this thread. I had this one marked as
read, but I only really read the first half of it.

Even though I didn't see it, I will admit that even if I had, I would not
have said anything because I'm so use to it and I'm somewhat blind to it
until someone points it out to me.

I'm not on the CoC committee, but I am on the TAB, and I will officially
state that comment was not appropriate.

Linus, please let's keep this technical.

-- Steve

