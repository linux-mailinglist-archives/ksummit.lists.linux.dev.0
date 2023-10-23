Return-Path: <ksummit+bounces-1195-lists=lfdr.de@lists.linux.dev>
X-Original-To: lists@lfdr.de
Delivered-To: lists@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [147.75.48.161])
	by mail.lfdr.de (Postfix) with ESMTPS id 4BA537D4049
	for <lists@lfdr.de>; Mon, 23 Oct 2023 21:29:32 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id C12FFB20FF2
	for <lists@lfdr.de>; Mon, 23 Oct 2023 19:29:29 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id C3B22224FA;
	Mon, 23 Oct 2023 19:29:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; dkim=none
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 42FB5224E0;
	Mon, 23 Oct 2023 19:29:21 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id BCC3CC433C8;
	Mon, 23 Oct 2023 19:29:20 +0000 (UTC)
Date: Mon, 23 Oct 2023 15:29:18 -0400
From: Steven Rostedt <rostedt@goodmis.org>
To: "Paul E. McKenney" <paulmck@kernel.org>
Cc: Linus Torvalds <torvalds@linux-foundation.org>, Andrew Morton
 <akpm@linux-foundation.org>, Konstantin Ryabitsev <mricon@kernel.org>, Dan
 Carpenter <dan.carpenter@linaro.org>, ksummit@lists.linux.dev,
 outreachy@lists.linux.dev, kernel-janitors@vger.kernel.org
Subject: Re: KTODO automated TODO lists
Message-ID: <20231023152918.4eb91ee3@gandalf.local.home>
In-Reply-To: <CAHk-=wiS=h7XBt0UMHq_8xWZxR_hmFik_j=SwTp9LzHhJVW=aQ@mail.gmail.com>
References: <369bc919-1a1d-4f37-9cc9-742a86a41282@kadam.mountain>
	<20231023114949.34fc967988c354547f79c4e7@linux-foundation.org>
	<CAHk-=wiS=h7XBt0UMHq_8xWZxR_hmFik_j=SwTp9LzHhJVW=aQ@mail.gmail.com>
X-Mailer: Claws Mail 3.19.1 (GTK+ 2.24.33; x86_64-pc-linux-gnu)
Precedence: bulk
X-Mailing-List: ksummit@lists.linux.dev
List-Id: <ksummit.lists.linux.dev>
List-Subscribe: <mailto:ksummit+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:ksummit+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit

On Mon, 23 Oct 2023 08:55:56 -1000
Linus Torvalds <torvalds@linux-foundation.org> wrote:

> On Mon, 23 Oct 2023 at 08:49, Andrew Morton <akpm@linux-foundation.org> wrote:
> >
> > Well here's a task: write a bot which follows the mailing lists and
> > sends people nastygrams if one of their emails is more than 95%(?)
> > quoted text.  
> 
> I think that might be better off as a spam filter rule.
> 
> Don't make it some after-the-fact "trawl the lists". Just make it a
> bounce with a "you quoted too much". Same as the html avoidance.
> 
> Make it ok to quote 15 lines of commit message for a "Reviewed-by:"
> kind of reply, but if it's more than 50 lines of quoting, trigger a
> "at least equal parts new message".
> 
> I'm sure Konstantin has nothing better to do...
> 
>                 Linus

Paul,

Just in case you are wondering why one day one of your replies gets
rejected ;-)

-- Steve

