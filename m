Return-Path: <ksummit+bounces-1098-lists=lfdr.de@lists.linux.dev>
X-Original-To: lists@lfdr.de
Delivered-To: lists@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id EE2E179724B
	for <lists@lfdr.de>; Thu,  7 Sep 2023 14:28:45 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id A91F428158B
	for <lists@lfdr.de>; Thu,  7 Sep 2023 12:28:44 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 257A463C0;
	Thu,  7 Sep 2023 12:28:38 +0000 (UTC)
X-Original-To: ksummit@lists.linux.dev
Received: from gate.crashing.org (gate.crashing.org [63.228.1.57])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 1EF1E63A3
	for <ksummit@lists.linux.dev>; Thu,  7 Sep 2023 12:28:35 +0000 (UTC)
Received: from gate.crashing.org (localhost.localdomain [127.0.0.1])
	by gate.crashing.org (8.14.1/8.14.1) with ESMTP id 387COOIC021430;
	Thu, 7 Sep 2023 07:24:24 -0500
Received: (from segher@localhost)
	by gate.crashing.org (8.14.1/8.14.1/Submit) id 387CONbt021422;
	Thu, 7 Sep 2023 07:24:23 -0500
X-Authentication-Warning: gate.crashing.org: segher set sender to segher@kernel.crashing.org using -f
Date: Thu, 7 Sep 2023 07:24:22 -0500
From: Segher Boessenkool <segher@kernel.crashing.org>
To: Steven Rostedt <rostedt@goodmis.org>
Cc: Dan Carpenter <dan.carpenter@linaro.org>,
        Dave Chinner <david@fromorbit.com>, Guenter Roeck <linux@roeck-us.net>,
        Christoph Hellwig <hch@infradead.org>, ksummit@lists.linux.dev,
        linux-fsdevel@vger.kernel.org, gcc-patches@gcc.gnu.org
Subject: Re: [MAINTAINERS/KERNEL SUMMIT] Trust and maintenance of file systems
Message-ID: <20230907122422.GI19790@gate.crashing.org>
References: <ZO9NK0FchtYjOuIH@infradead.org> <8718a8a3-1e62-0e2b-09d0-7bce3155b045@roeck-us.net> <ZPkDLp0jyteubQhh@dread.disaster.area> <20230906215327.18a45c89@gandalf.local.home> <4af7c904-ac36-44c9-83c4-2cb30c732672@kadam.mountain> <20230907110409.GH19790@gate.crashing.org> <20230907072245.666b2fda@gandalf.local.home>
Precedence: bulk
X-Mailing-List: ksummit@lists.linux.dev
List-Id: <ksummit.lists.linux.dev>
List-Subscribe: <mailto:ksummit+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:ksummit+unsubscribe@lists.linux.dev>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20230907072245.666b2fda@gandalf.local.home>
User-Agent: Mutt/1.4.2.3i

On Thu, Sep 07, 2023 at 07:22:45AM -0400, Steven Rostedt wrote:
> On Thu, 7 Sep 2023 06:04:09 -0500
> Segher Boessenkool <segher@kernel.crashing.org> wrote:
> > On Thu, Sep 07, 2023 at 12:48:25PM +0300, Dan Carpenter via Gcc-patches wrote:
> > No.  You should patch your program, instead.  One easy way is to add a
> > -Wno-error at the end of your command lines.  Or even just -w if you
> > want or need a bigger hammer.
> 
> That's not really possible when bisecting a kernel bug into older kernels.
> The build system is highly complex and requires hundreds of changes to do
> what you suggested. As it is for a bisection that takes a minimum of 13
> iterations, your approach just isn't feasible.

Isn't this exactly what KCFLAGS is for?

But, I meant to edit the build system.  It isn't so hard to bisect with
patch stacks on top.  Just a bit annoying.


Segher

