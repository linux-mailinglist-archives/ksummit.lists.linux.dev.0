Return-Path: <ksummit+bounces-791-lists=lfdr.de@lists.linux.dev>
X-Original-To: lists@lfdr.de
Delivered-To: lists@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 1C92E5EF737
	for <lists@lfdr.de>; Thu, 29 Sep 2022 16:11:30 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 4A7401C20A05
	for <lists@lfdr.de>; Thu, 29 Sep 2022 14:11:29 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 172B91C3A;
	Thu, 29 Sep 2022 14:11:22 +0000 (UTC)
X-Original-To: ksummit@lists.linux.dev
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3C8441C13;
	Thu, 29 Sep 2022 14:11:20 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id CB9E7C433C1;
	Thu, 29 Sep 2022 14:11:18 +0000 (UTC)
Date: Thu, 29 Sep 2022 10:12:31 -0400
From: Steven Rostedt <rostedt@goodmis.org>
To: Thorsten Leemhuis <linux@leemhuis.info>
Cc: Konstantin Ryabitsev <konstantin@linuxfoundation.org>, "Artem S.
 Tashkinov" <aros@gmx.com>, workflows@vger.kernel.org, LKML
 <linux-kernel@vger.kernel.org>, Greg KH <gregkh@linuxfoundation.org>, Linus
 Torvalds <torvalds@linux-foundation.org>, "regressions@lists.linux.dev"
 <regressions@lists.linux.dev>, ksummit@lists.linux.dev
Subject: Re: Planned changes for bugzilla.kernel.org to reduce the "Bugzilla
 blues"
Message-ID: <20220929101231.58c052f1@gandalf.local.home>
In-Reply-To: <4f704d2f-12b5-8d6a-357e-d79b1e871ed7@leemhuis.info>
References: <aa876027-1038-3e4a-b16a-c144f674c0b0@leemhuis.info>
	<05d149a0-e3de-8b09-ecc0-3ea73e080be3@leemhuis.info>
	<20220929094753.6bba89d8@gandalf.local.home>
	<4f704d2f-12b5-8d6a-357e-d79b1e871ed7@leemhuis.info>
X-Mailer: Claws Mail 3.17.8 (GTK+ 2.24.33; x86_64-pc-linux-gnu)
Precedence: bulk
X-Mailing-List: ksummit@lists.linux.dev
List-Id: <ksummit.lists.linux.dev>
List-Subscribe: <mailto:ksummit+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:ksummit+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit

On Thu, 29 Sep 2022 16:02:56 +0200
Thorsten Leemhuis <linux@leemhuis.info> wrote:

> Ohh, yeah, sorry, should have mentioned this. Don't worry, I'm aware of
> this particular and a few similar products/components in bugzilla. I
> don't plan changing any of them, unless something unforeseen or a very
> good reason comes up (for example if they're obviously unused for years
> or something like that).

Well, years of not being used may not be a good indicator. I use bugzilla
as a dumping ground of my "todo lists". And I find sometimes it may take
years before I get to them ;-)

-- Steve

