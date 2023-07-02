Return-Path: <ksummit+bounces-945-lists=lfdr.de@lists.linux.dev>
X-Original-To: lists@lfdr.de
Delivered-To: lists@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 3EC3A744C01
	for <lists@lfdr.de>; Sun,  2 Jul 2023 03:46:16 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 2B1F61C208C7
	for <lists@lfdr.de>; Sun,  2 Jul 2023 01:46:15 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 43DB138D;
	Sun,  2 Jul 2023 01:46:08 +0000 (UTC)
X-Original-To: ksummit@lists.linux.dev
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A2555376
	for <ksummit@lists.linux.dev>; Sun,  2 Jul 2023 01:46:06 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 98F6BC433C8;
	Sun,  2 Jul 2023 01:46:05 +0000 (UTC)
Date: Sat, 1 Jul 2023 21:46:03 -0400
From: Steven Rostedt <rostedt@goodmis.org>
To: Jonathan Corbet <corbet@lwn.net>
Cc: Jani Nikula <jani.nikula@intel.com>, ksummit@lists.linux.dev
Subject: Re: Intersphinx ([TECH TOPIC] Kernel documentation)
Message-ID: <20230701214603.6d0b299b@rorschach.local.home>
In-Reply-To: <87y1k2kl5a.fsf@meer.lwn.net>
References: <87fs6rxppz.fsf@meer.lwn.net>
	<871qi6glzl.fsf@intel.com>
	<87y1k2kl5a.fsf@meer.lwn.net>
X-Mailer: Claws Mail 3.17.8 (GTK+ 2.24.33; x86_64-pc-linux-gnu)
Precedence: bulk
X-Mailing-List: ksummit@lists.linux.dev
List-Id: <ksummit.lists.linux.dev>
List-Subscribe: <mailto:ksummit+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:ksummit+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit

On Thu, 29 Jun 2023 15:34:41 -0600
Jonathan Corbet <corbet@lwn.net> wrote:

> There is a catch, though: In order to be able to create the cross
> references, intersphinx has to be able to read the "objects.inv" file
> for every other document it refers to.  That file, of course, is created
> by building the docs.  In practice this means that, to generate a
> complete set of manuals from a clean repository, it would be necessary
> to do *two* complete builds - one to create the inventory files, and one
> to use them.

Could it be possible to check in these files into git, and have the
Documentation maintainer update them whenever there's a need? (yes I
like to volunteer people for jobs I don't do)

This is similar to using flex and bison, where I have the files they
generate prebuilt and checked in so that the user doesn't need to do it
when they build the repository.

-- Steve

