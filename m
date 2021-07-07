Return-Path: <ksummit+bounces-297-lists=lfdr.de@lists.linux.dev>
X-Original-To: lists@lfdr.de
Delivered-To: lists@lfdr.de
Received: from ewr.edge.kernel.org (ewr.edge.kernel.org [IPv6:2604:1380:1:3600::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 7DFE83BEB91
	for <lists@lfdr.de>; Wed,  7 Jul 2021 17:48:50 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ewr.edge.kernel.org (Postfix) with ESMTPS id 5A5EB1C0EB5
	for <lists@lfdr.de>; Wed,  7 Jul 2021 15:48:49 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id C8A132F80;
	Wed,  7 Jul 2021 15:48:42 +0000 (UTC)
X-Original-To: ksummit@lists.linux.dev
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C54C1168
	for <ksummit@lists.linux.dev>; Wed,  7 Jul 2021 15:48:41 +0000 (UTC)
Received: from oasis.local.home (cpe-66-24-58-225.stny.res.rr.com [66.24.58.225])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPSA id DAFD661CBF;
	Wed,  7 Jul 2021 15:48:40 +0000 (UTC)
Date: Wed, 7 Jul 2021 11:48:34 -0400
From: Steven Rostedt <rostedt@goodmis.org>
To: Miguel Ojeda <miguel.ojeda.sandonis@gmail.com>
Cc: ksummit@lists.linux.dev
Subject: Re: [TECH TOPIC] Rust for Linux
Message-ID: <20210707114834.64037813@oasis.local.home>
In-Reply-To: <CANiq72kF7AbiJCTHca4A0CxDDJU90j89uh80S3pDqDt7-jthOg@mail.gmail.com>
References: <CANiq72kF7AbiJCTHca4A0CxDDJU90j89uh80S3pDqDt7-jthOg@mail.gmail.com>
X-Mailer: Claws Mail 3.17.3 (GTK+ 2.24.33; x86_64-pc-linux-gnu)
Precedence: bulk
X-Mailing-List: ksummit@lists.linux.dev
List-Id: <ksummit.lists.linux.dev>
List-Subscribe: <mailto:ksummit+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:ksummit+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit

On Sat, 26 Jun 2021 00:09:00 +0200
Miguel Ojeda <miguel.ojeda.sandonis@gmail.com> wrote:

> The Rust for Linux project is adding support for the Rust language to
> the Linux kernel. This talk describes the work done so far and also
> serves as an introduction for other kernel developers interested in
> using Rust in the kernel.
> 
> It covers:
> 
> - A quick introduction of the Rust language within the context of the kernel.
> - How Rust support works in the kernel: overall infrastructure,
> compilation model, the standard library (`core` and `alloc`), etc.
> - How Documentation for Rust code looks like.
> - Testing Rust code (unit tests and self tests).
> - Overview of tooling (e.g. compiler as a library, custom linters, Miri, etc.).
> - Explanation of coding guidelines (e.g. automatic formatting) and
> policies we follow (e.g. the `SAFETY` comments).
> - How kernel driver code looks like in Rust.

[ Starting at the OP of the thread as this is a different topic ]

BTW, does rust support "fentry/mcount" code? If not, that means ftrace
(and all the hooks we have inside the kernel) are not going to be able
to use it? That's one big "notrace" across all drivers that implement
Rust?

-- Steve


