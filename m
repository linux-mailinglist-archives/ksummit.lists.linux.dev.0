Return-Path: <ksummit+bounces-982-lists=lfdr.de@lists.linux.dev>
X-Original-To: lists@lfdr.de
Delivered-To: lists@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 8529D77D19C
	for <lists@lfdr.de>; Tue, 15 Aug 2023 20:19:26 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 11A752815A6
	for <lists@lfdr.de>; Tue, 15 Aug 2023 18:19:25 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 8B70617FF5;
	Tue, 15 Aug 2023 18:19:18 +0000 (UTC)
X-Original-To: ksummit@lists.linux.dev
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 21AF713AFD
	for <ksummit@lists.linux.dev>; Tue, 15 Aug 2023 18:19:16 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 6C8FCC433C8;
	Tue, 15 Aug 2023 18:19:16 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1692123556;
	bh=o0hx/5GeGHTAkaJoYZtV4H0uYDuGye29PSkWDon+EqA=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=ZyIde4CrvZAmyk3lE2oZ0ywnkdESMqHm4Y60Rx86Fxpq28nKyxYwbrtDHtx2+nxTS
	 fYUdnKws7I6/dlR6CPhCvfFM84JujX/XNZyrH4R3dW3yaSji8WMCKsVVKVUkoaJC9w
	 qRO7+if7FW3Tt6ILHzasSJ+wrdz2JLbv5PHy89xd5kBAn+jYw6oB4HvQRXtKtPKwJm
	 synLolu9iTBLmNNeZFHlZpfaGDSF2LLxx5vALPFcPObwrVPH8qYTZdVwmJ5gvvgg0N
	 6bNNXbHJITf/exJvdFGIhe+UR6Dl11a4TJDusjnmdUx6GF5JNMZZCqrld1Sd3jMBGe
	 JlGF50M1RaJwQ==
Date: Tue, 15 Aug 2023 14:19:14 -0400
From: Sasha Levin <sashal@kernel.org>
To: Dave Hansen <dave@sr71.net>
Cc: ksummit@lists.linux.dev
Subject: Re: [MAINTAINERS SUMMIT] Quality standards for embargoed code
Message-ID: <ZNvBomFMyZTYm7ye@sashalap>
References: <ZNuuvS5BtmjcazIv@sashalap>
 <53f0072b-91c0-0136-a689-f31e8508a862@sr71.net>
Precedence: bulk
X-Mailing-List: ksummit@lists.linux.dev
List-Id: <ksummit.lists.linux.dev>
List-Subscribe: <mailto:ksummit+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:ksummit+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii; format=flowed
Content-Disposition: inline
In-Reply-To: <53f0072b-91c0-0136-a689-f31e8508a862@sr71.net>

On Tue, Aug 15, 2023 at 10:19:21AM -0700, Dave Hansen wrote:
>On 8/15/23 09:58, Sasha Levin wrote:
>> I'd like to have a discussion about how the community handles code
>> drops to address embargoed security issues: my concern is that we
>> sidestap our regular development workflow (post patches, review,
>> test, bots, etc...)
>
>I couldn't agree more.  Working on these issues feels like you're
>hacking with one arm tied behind your back.  Things are _way_ better
>than they used to be, but the closer the folks working behind closed
>doors get to the "regular" workflows, the better off everyone is.
>
>> 1. Ask (require) organizations that repeatedly go through this mechanism
>> to create a test environment that can demonstrate how the embargoed code
>> passes different build/validation tests. We should set a minimal bar to
>> the demonstrated quality of code that we'll "sneak" behind the backs of
>> community members.
>
>Intel does send things through 0day internally, with a few minor
>differences from how public stuff gets tested.  But, I don't think any
>information about that internal testing ever makes it into the material
>that get merged.  We'll fix that.

Beyond running tests, it would also be great to standardize on what we
need to run, and if Intel wants to start the discussion by openning up
it's tests for embargoed code then it'll e a great start!

>> 2. Create a group of trusted "testers" who can test embargoed code with
>> different (ideally "real") workloads and environments. I think that
>> we're overly focused on keeping the circle of people in the know small.
>
>The docs:
>
>> https://www.kernel.org/doc/html/latest/process/embargoed-hardware-issues.html
>
>_should_ allow the "hardware security team" to add testers today:

It probably does, but the way it's written now you'd need a lawyer to
confirm that.

It also definitely happened before where developers were pulled in just
to test something specific (like the Itanium fixes not long ago), but
this just feels like an one-off rather than something that happens for
every embargoed issue.

>> The hardware security team identifies the developers (domain experts)
>> who will form the initial response team for a particular issue. The
>> initial response team can bring in further developers (domain
>> experts) to address the issue in the best technical way.
>Do we need to make this more explicit that some of those developers
>might be focused on testing?

Not only that, but I think that we should have a standard set of testers
(let it be bots of humans), rather than developers that are pulled in
ad-hoc. The current process has a lot of friction around involving
parties that are not strictly needed for the development of the fix.

To me this is an attempt to get as much real world testing as we can get
with the smallest group possible.

-- 
Thanks,
Sasha

