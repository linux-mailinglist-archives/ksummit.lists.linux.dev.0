Return-Path: <ksummit+bounces-974-lists=lfdr.de@lists.linux.dev>
X-Original-To: lists@lfdr.de
Delivered-To: lists@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id B606577CEA6
	for <lists@lfdr.de>; Tue, 15 Aug 2023 17:04:32 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id E42901C20CA1
	for <lists@lfdr.de>; Tue, 15 Aug 2023 15:04:31 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id D6E9C13FE3;
	Tue, 15 Aug 2023 15:04:24 +0000 (UTC)
X-Original-To: ksummit@lists.linux.dev
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 444841097E
	for <ksummit@lists.linux.dev>; Tue, 15 Aug 2023 15:04:22 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 21186C433C7;
	Tue, 15 Aug 2023 15:04:22 +0000 (UTC)
Date: Tue, 15 Aug 2023 11:04:22 -0400
From: Steven Rostedt <rostedt@goodmis.org>
To: Greg KH <gregkh@linuxfoundation.org>
Cc: Catalin Marinas <catalin.marinas@arm.com>, Vegard Nossum
 <vegard.nossum@oracle.com>, Jiri Kosina <jkosina@suse.cz>,
 ksummit@lists.linux.dev
Subject: Re: [MAINTAINERS SUMMIT] Handling of embargoed security issues --
 security@korg vs. linux-distros@
Message-ID: <20230815110422.2366cc0b@gandalf.local.home>
In-Reply-To: <2023081553-deodorize-crumpet-ee9a@gregkh>
References: <nycvar.YFH.7.76.2308150927190.14207@cbobk.fhfr.pm>
	<658e739b-c164-c360-d6a3-eb4fb15ae02e@oracle.com>
	<2023081515-lake-spotty-6a3a@gregkh>
	<20230815084253.7091083e@gandalf.local.home>
	<ZNuJkCHnaCb95zj/@arm.com>
	<2023081553-deodorize-crumpet-ee9a@gregkh>
X-Mailer: Claws Mail 3.19.1 (GTK+ 2.24.33; x86_64-pc-linux-gnu)
Precedence: bulk
X-Mailing-List: ksummit@lists.linux.dev
List-Id: <ksummit.lists.linux.dev>
List-Subscribe: <mailto:ksummit+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:ksummit+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit

On Tue, 15 Aug 2023 16:41:37 +0200
Greg KH <gregkh@linuxfoundation.org> wrote:

> Loads of companies/governments have been pestering us for access to
> security@k.o for decades now, this isn't going to change for the obvious
> reason that having such groups on the list is not going to help us fix
> any problem, but instead, just give everyone early access to known
> security problems.
> 
> Same thing would happen for any potential distro@k.o list, remember who
> some of the largest users of Linux is (i.e. governments) and many of
> them have their own custom "distros" for their systems for valid
> reasons.
> 
> So no, we can't do that if you care about security overall, this would
> make things insecure.

Even if the only thing that is shown is a commit sha that should be taken?

-- Steve

