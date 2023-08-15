Return-Path: <ksummit+bounces-993-lists=lfdr.de@lists.linux.dev>
X-Original-To: lists@lfdr.de
Delivered-To: lists@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id BFA0B77D62D
	for <lists@lfdr.de>; Wed, 16 Aug 2023 00:34:01 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id F14A81C20EC7
	for <lists@lfdr.de>; Tue, 15 Aug 2023 22:34:00 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id EBD2919BD5;
	Tue, 15 Aug 2023 22:31:22 +0000 (UTC)
X-Original-To: ksummit@lists.linux.dev
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4B2D01988D
	for <ksummit@lists.linux.dev>; Tue, 15 Aug 2023 22:31:20 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 22AB1C433C7;
	Tue, 15 Aug 2023 22:31:20 +0000 (UTC)
Date: Tue, 15 Aug 2023 18:31:20 -0400
From: Steven Rostedt <rostedt@goodmis.org>
To: Jiri Kosina <jikos@kernel.org>
Cc: Greg KH <gregkh@linuxfoundation.org>, Vegard Nossum
 <vegard.nossum@oracle.com>, ksummit@lists.linux.dev
Subject: Re: [MAINTAINERS SUMMIT] Handling of embargoed security issues --
 security@korg vs. linux-distros@
Message-ID: <20230815183120.0c92a759@gandalf.local.home>
In-Reply-To: <nycvar.YFH.7.76.2308160005300.14207@cbobk.fhfr.pm>
References: <nycvar.YFH.7.76.2308150927190.14207@cbobk.fhfr.pm>
	<658e739b-c164-c360-d6a3-eb4fb15ae02e@oracle.com>
	<2023081515-lake-spotty-6a3a@gregkh>
	<20230815084253.7091083e@gandalf.local.home>
	<2023081540-vindicate-caterer-33c6@gregkh>
	<nycvar.YFH.7.76.2308160005300.14207@cbobk.fhfr.pm>
X-Mailer: Claws Mail 3.19.1 (GTK+ 2.24.33; x86_64-pc-linux-gnu)
Precedence: bulk
X-Mailing-List: ksummit@lists.linux.dev
List-Id: <ksummit.lists.linux.dev>
List-Subscribe: <mailto:ksummit+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:ksummit+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit

On Wed, 16 Aug 2023 00:13:56 +0200 (CEST)
Jiri Kosina <jikos@kernel.org> wrote:

> > The huge majority of Linux use in the world is Android, everything else
> > is a rounding error.   
> 
> Sorry, but in my view this is a slight oversimplification.

I agree. And that's just taking in "numbers". What about impact. If there's
a security flaw in an android phone, it opens up each individual for an
attack, but it usually requires an attacker to hit them individually.

But if an enterprise is hit. All it takes is to go after one server, and
you have access to thousands of users and their private data.

It's not just the number of installations that count.

-- Steve

