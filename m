Return-Path: <ksummit+bounces-709-lists=lfdr.de@lists.linux.dev>
X-Original-To: lists@lfdr.de
Delivered-To: lists@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 9F92055A488
	for <lists@lfdr.de>; Sat, 25 Jun 2022 00:58:13 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 03C3D280C8D
	for <lists@lfdr.de>; Fri, 24 Jun 2022 22:58:12 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id EF7C746BA;
	Fri, 24 Jun 2022 22:58:04 +0000 (UTC)
X-Original-To: ksummit@lists.linux.dev
Received: from ms.lwn.net (ms.lwn.net [45.79.88.28])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BB71B23A0
	for <ksummit@lists.linux.dev>; Fri, 24 Jun 2022 22:58:03 +0000 (UTC)
Received: from localhost (unknown [IPv6:2601:281:8300:73::5f6])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ms.lwn.net (Postfix) with ESMTPSA id 05A2E31A;
	Fri, 24 Jun 2022 22:57:56 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 ms.lwn.net 05A2E31A
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=lwn.net; s=20201203;
	t=1656111477; bh=z/hZkB46cw4dS9nbEfvgbK2pP9iGg5M1jrlbqNbw6q4=;
	h=From:To:Cc:Subject:In-Reply-To:References:Date:From;
	b=JHsEJDsYr9I2IqRrRcpBb8pdpyAQDCoa/qSK2NdtyO05rwkhWNTHlblzefubEdjMv
	 KnIife5gcAyLbbQV39q0uLDiuFBVXqoZic6jmasJQjLFObrLxEaKcUsVjxrZetrcj2
	 YTlyNbLfvKwZvuqX8dJGlt2AiUuHIyi1W2mdHMScfu6+Tzq/ACIX3F75O0epVxFBRo
	 lO4529A7sd+boumH3SOSbuicYWqs52bEM7WYFbpAOuRRSmets65r/7nMKSFz/UGgPx
	 54FOj5mWGu2K2GgNT9VjjQ8sM+orM6Cx5X4/EVXnGXRJImBBmHpBywZCENZKhGmW78
	 N8HqNsAANUcCQ==
From: Jonathan Corbet <corbet@lwn.net>
To: Mauro Carvalho Chehab <mchehab@kernel.org>
Cc: Jani Nikula <jani.nikula@intel.com>,
 ksummit-discuss@lists.linuxfoundation.org, ksummit@lists.linux.dev, Markus
 Heiser <markus.heiser@darmarit.de>
Subject: Re: [Ksummit-discuss] [TECH TOPIC] What kernel documentation could be
In-Reply-To: <20220624083307.159824bd@sal.lan>
References: <87sfo3nh3t.fsf@meer.lwn.net> <20220618092447.5ebed314@sal.lan>
 <875ykrrb45.fsf@intel.com> <20220623105747.079ac92b@sal.lan>
 <87a6a38plu.fsf@meer.lwn.net> <20220624083307.159824bd@sal.lan>
Date: Fri, 24 Jun 2022 16:57:56 -0600
Message-ID: <87tu891xfv.fsf@meer.lwn.net>
Precedence: bulk
X-Mailing-List: ksummit@lists.linux.dev
List-Id: <ksummit.lists.linux.dev>
List-Subscribe: <mailto:ksummit+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:ksummit+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain

Mauro Carvalho Chehab <mchehab@kernel.org> writes:

> Em Thu, 23 Jun 2022 07:40:45 -0600
> Jonathan Corbet <corbet@lwn.net> escreveu:
>> I've actually, in a spare moment or two, been doing some profiling of
>> the kernel docs build and trying to track down the sources of the
>> slowness.  I am thinking that nearly 700 *million* calls to the iterator
>> for the C-domain symbol list might have something to do with it...
>
> Wow, that's a lot!

Just for the curious ...

The Sphinx C domain code makes this elaborate tree data structure out of
all the identifier names it has picked up - including the names of
function parameters when they are provided in prototypes for some
reason.  This is the structure that is consulted whenever we want to
resolve a cross-reference, which is fairly often with automarkup
enabled.

How does it work?  The algorithm is, as far as I can tell:

 - Serialize the whole tree in a sort of breadth-first traversal

 - Make a linear pass through the *entire* list, comparing the
   identifier name with each entry and accumulating a list of all the
   matches found.

 - Return the first match and throw away the rest.

The result is O(n^2) behavior and, in the kernel docs build, n gets to
be fairly large.

I went in with a crowbar and sledgehammer and replaced some of the list
searches with a dict lookup, resulting in about a 20% speedup in the
full htmldocs build with Sphinx 5.0.2.  A couple of automarkup
optimizations result in about a 27% speedup overall.  And I didn't break
any cross-references.

I think it's possible to do better, but this is a start.  I'll post the
automarkup changes as soon as I can, but I need to verify them across
the whole range of Sphinx versions.  For the Sphinx stuff, I'll need to
turn my hatchetwork into something presentable and figure out how to
contribute it upstream, but it seems worth the effort.

Thanks,

jon

