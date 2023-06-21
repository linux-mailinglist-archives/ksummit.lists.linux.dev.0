Return-Path: <ksummit+bounces-939-lists=lfdr.de@lists.linux.dev>
X-Original-To: lists@lfdr.de
Delivered-To: lists@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id F26EA737FC7
	for <lists@lfdr.de>; Wed, 21 Jun 2023 13:05:13 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 2E37A1C20E58
	for <lists@lfdr.de>; Wed, 21 Jun 2023 11:05:13 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 3CB84101E9;
	Wed, 21 Jun 2023 11:05:06 +0000 (UTC)
X-Original-To: ksummit@lists.linux.dev
Received: from wp530.webpack.hosteurope.de (wp530.webpack.hosteurope.de [80.237.130.52])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CC7EEC2F0
	for <ksummit@lists.linux.dev>; Wed, 21 Jun 2023 11:05:03 +0000 (UTC)
Received: from [2a02:8108:8980:2478:8cde:aa2c:f324:937e]; authenticated
	by wp530.webpack.hosteurope.de running ExIM with esmtpsa (TLS1.3:ECDHE_RSA_AES_128_GCM_SHA256:128)
	id 1qBvdz-000630-D9; Wed, 21 Jun 2023 13:04:59 +0200
Message-ID: <2da0858e-3ffb-5096-e8f7-e8c6073a89c0@leemhuis.info>
Date: Wed, 21 Jun 2023 13:04:56 +0200
Precedence: bulk
X-Mailing-List: ksummit@lists.linux.dev
List-Id: <ksummit.lists.linux.dev>
List-Subscribe: <mailto:ksummit+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:ksummit+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.12.0
Content-Language: en-US, de-DE
To: Jonathan Corbet <corbet@lwn.net>, ksummit@lists.linux.dev
References: <87fs6rxppz.fsf@meer.lwn.net>
From: Thorsten Leemhuis <linux@leemhuis.info>
Subject: Re: [TECH TOPIC] Kernel documentation
In-Reply-To: <87fs6rxppz.fsf@meer.lwn.net>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-bounce-key: webpack.hosteurope.de;linux@leemhuis.info;1687345503;74af988c;
X-HE-SMSGID: 1qBvdz-000630-D9

On 16.06.23 19:48, Jonathan Corbet wrote:
> The documentation discussion at past kernel summits has been lively, so
> I think we should do it again.  Some topics I would bring to a session
> this year would include:
> 
> - The ongoing restructuring of the Documentation/ directory.  I've been
>   slowly moving the architecture docs into Documentation/arch/, but
>   would like to do more to reduce the clutter of the top-level directory
>   and make our documentation tree more closely resemble the organization
>   of the source.
> 
> - Structure.  We continue to collect documents, but do little to tie
>   them together into a coherent whole.  Do we want to change that and,
>   if so, how?

I wonder if it we should try to get some external input for these points
from people with (a) experience in the field and (b) an untainted
viewpoint. And no, I'm not talking about bringing in McKinsey or
PricewaterhouseCoopers. ;) I mean people that are not regularly
contributing to Linux, but have experience with writing docs for
(ideally large) Open Source projects and/or reorganizing large chunks of
docs that accumulated in a project over many years.

Does maybe anyone reading this have ties to someone from groups like
Write the Docs (https://www.writethedocs.org/)? Maybe someone there
might have the right experience and at the same time be willing to
provide us with some input or guidance.

Or do Linux distributors like Red Hat and SUSE maybe have an interest in
improving upstream kernel docs, because it might make their work easier?
If they have at least a little interest, they might be willing to ask
their docs teams to provide a few ideas for us. And if they care a lot,
it might even be quite relevant...
> - Support for documentation work.  There is nobody in the community who
>   is paid to put any significant time into documentation, and it shows.
>   How can we fix that?

...for this point. Or was this tried already without success?

Regarding contacting external people for input or help: I met someone on
two or three conferences that was involved in "Write the Docs", but that
was years ago and I don't know if that person is still active in that
space. I also know somebody that at least used to work on docs for Suse,
but afaik not in the kernel space.

I could ask those two if that's wanted.

But I wonder if somebody here has better connections that would be a
better angle of approach (especially to the docs teams for RH and SUSE).

Side note: during last years session there was someone with many good
ideas in the chat, which Willy read to the audience. It was a partner of
a kernel developer iirc. Maybe that person might also be a good fit to
ask for advice, too.

> [...]

Ciao, Thorsten

