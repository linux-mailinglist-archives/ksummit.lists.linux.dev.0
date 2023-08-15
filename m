Return-Path: <ksummit+bounces-980-lists=lfdr.de@lists.linux.dev>
X-Original-To: lists@lfdr.de
Delivered-To: lists@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id AD01177D0FA
	for <lists@lfdr.de>; Tue, 15 Aug 2023 19:28:45 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 890921C209F4
	for <lists@lfdr.de>; Tue, 15 Aug 2023 17:28:44 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id C6BBD15AC8;
	Tue, 15 Aug 2023 17:28:37 +0000 (UTC)
X-Original-To: ksummit@lists.linux.dev
Received: from blackbird.sr71.net (unknown [198.145.64.142])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 53C72134CE
	for <ksummit@lists.linux.dev>; Tue, 15 Aug 2023 17:28:35 +0000 (UTC)
Received: from [134.134.137.85] (unknown [134.134.137.85])
	(Authenticated sender: dave)
	by blackbird.sr71.net (Postfix) with ESMTPSA id B774D201D2;
	Tue, 15 Aug 2023 10:19:22 -0700 (PDT)
Message-ID: <53f0072b-91c0-0136-a689-f31e8508a862@sr71.net>
Date: Tue, 15 Aug 2023 10:19:21 -0700
Precedence: bulk
X-Mailing-List: ksummit@lists.linux.dev
List-Id: <ksummit.lists.linux.dev>
List-Subscribe: <mailto:ksummit+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:ksummit+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.13.0
Subject: Re: [MAINTAINERS SUMMIT] Quality standards for embargoed code
Content-Language: en-US
To: Sasha Levin <sashal@kernel.org>, ksummit@lists.linux.dev
References: <ZNuuvS5BtmjcazIv@sashalap>
From: Dave Hansen <dave@sr71.net>
In-Reply-To: <ZNuuvS5BtmjcazIv@sashalap>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 8/15/23 09:58, Sasha Levin wrote:
> I'd like to have a discussion about how the community handles code
> drops to address embargoed security issues: my concern is that we
> sidestap our regular development workflow (post patches, review,
> test, bots, etc...)

I couldn't agree more.  Working on these issues feels like you're
hacking with one arm tied behind your back.  Things are _way_ better
than they used to be, but the closer the folks working behind closed
doors get to the "regular" workflows, the better off everyone is.

> 1. Ask (require) organizations that repeatedly go through this mechanism
> to create a test environment that can demonstrate how the embargoed code
> passes different build/validation tests. We should set a minimal bar to
> the demonstrated quality of code that we'll "sneak" behind the backs of
> community members.

Intel does send things through 0day internally, with a few minor
differences from how public stuff gets tested.  But, I don't think any
information about that internal testing ever makes it into the material
that get merged.  We'll fix that.

> 2. Create a group of trusted "testers" who can test embargoed code with
> different (ideally "real") workloads and environments. I think that
> we're overly focused on keeping the circle of people in the know small.

The docs:

> https://www.kernel.org/doc/html/latest/process/embargoed-hardware-issues.html

_should_ allow the "hardware security team" to add testers today:

> The hardware security team identifies the developers (domain experts)
> who will form the initial response team for a particular issue. The
> initial response team can bring in further developers (domain
> experts) to address the issue in the best technical way.
Do we need to make this more explicit that some of those developers
might be focused on testing?

> 3. Work with KernelCI/OpenSSF on setting up a (small) environment
> similar to the public one that we could run embargoed code through.

That would be really nice.



