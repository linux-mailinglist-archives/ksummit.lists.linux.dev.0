Return-Path: <ksummit+bounces-948-lists=lfdr.de@lists.linux.dev>
X-Original-To: lists@lfdr.de
Delivered-To: lists@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 12B76744FD1
	for <lists@lfdr.de>; Sun,  2 Jul 2023 20:32:51 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 4826B280CAF
	for <lists@lfdr.de>; Sun,  2 Jul 2023 18:32:49 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 8A01B3212;
	Sun,  2 Jul 2023 18:32:42 +0000 (UTC)
X-Original-To: ksummit@lists.linux.dev
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BFABF1C04
	for <ksummit@lists.linux.dev>; Sun,  2 Jul 2023 18:32:40 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id AC11BC433C9;
	Sun,  2 Jul 2023 18:32:39 +0000 (UTC)
Date: Sun, 2 Jul 2023 14:32:37 -0400
From: Steven Rostedt <rostedt@goodmis.org>
To: Linus Torvalds <torvalds@linux-foundation.org>
Cc: Jonathan Corbet <corbet@lwn.net>, Jani Nikula <jani.nikula@intel.com>,
 ksummit@lists.linux.dev
Subject: Re: Intersphinx ([TECH TOPIC] Kernel documentation)
Message-ID: <20230702143237.000a3330@gandalf.local.home>
In-Reply-To: <CAHk-=wgSEi_ZrHdqr=20xv+d6dr5G895CbOAi8ok+7-CQUN=fQ@mail.gmail.com>
References: <87fs6rxppz.fsf@meer.lwn.net>
	<871qi6glzl.fsf@intel.com>
	<87y1k2kl5a.fsf@meer.lwn.net>
	<20230701214603.6d0b299b@rorschach.local.home>
	<CAHk-=wgSEi_ZrHdqr=20xv+d6dr5G895CbOAi8ok+7-CQUN=fQ@mail.gmail.com>
X-Mailer: Claws Mail 3.17.8 (GTK+ 2.24.33; x86_64-pc-linux-gnu)
Precedence: bulk
X-Mailing-List: ksummit@lists.linux.dev
List-Id: <ksummit.lists.linux.dev>
List-Subscribe: <mailto:ksummit+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:ksummit+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit

On Sat, 1 Jul 2023 21:56:42 -0700
Linus Torvalds <torvalds@linux-foundation.org> wrote:

> Yes, we used to. It was a disaster.  It's versioning hell with
> different people having different tooling versions, so the "shipped"
> binaries then end up constantly depending on who generated them if
> anybody does any changes. And maintenance gets to be just more
> painful.
> 
> So I think for lex/yacc we simply always build things now. No shipped copies.

Interesting. For the tracing user space code, I had to start committing the
C file output for flex/bison because people were complaining that their
versions of flex and bison wouldn't make working C files. I had a newer
version that had some new features that I found I was using. Ever since I
just committed the C generated files into my repo, I haven't had any more
issues with people complaining about them.

-- Steve

