Return-Path: <ksummit+bounces-978-lists=lfdr.de@lists.linux.dev>
X-Original-To: lists@lfdr.de
Delivered-To: lists@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 98C9877D07A
	for <lists@lfdr.de>; Tue, 15 Aug 2023 18:58:52 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 529DF281546
	for <lists@lfdr.de>; Tue, 15 Aug 2023 16:58:51 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id ED4E9156DF;
	Tue, 15 Aug 2023 16:58:44 +0000 (UTC)
X-Original-To: ksummit@lists.linux.dev
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0AA86EDE
	for <ksummit@lists.linux.dev>; Tue, 15 Aug 2023 16:58:39 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 40C61C433C7
	for <ksummit@lists.linux.dev>; Tue, 15 Aug 2023 16:58:39 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1692118719;
	bh=rWQvMAu6pfAbtpjD5PJvdDOIsxP4hSm2gkOUSSPHE/Y=;
	h=Date:From:To:Subject:From;
	b=IoCId9pE8dkbqIoCkgQMywELxpUWDcUN2oe36bmM0Bdy56fPLlZW0mfp5BACrbev+
	 pP2LlMfwS3m4qn5eb1HLdbhleQYMAhvtZ1tEwMgUaIFC5pAsRXYgCrzLOaXZpIMiJq
	 Do6yEshpTmQV90sfCTqiMNXGtaYR/A8F9EQonxazrNKFxznLwa9PE7neJmjxce8Va3
	 Dv+/dx/ugCi7tHmtRNCRvcBOdOQ58Du2n6f6LH+eGZLuzijCdnzb43xJH9vKE/GkVZ
	 5SlHLl9whSkYAtZKAQuM8kDHs1l3cWm/gJlvkpG1hC2z2PYP3ZeJXoJsGNb/KjXQMr
	 ajOFVyqwgxxZg==
Date: Tue, 15 Aug 2023 12:58:37 -0400
From: Sasha Levin <sashal@kernel.org>
To: ksummit@lists.linux.dev
Subject: [MAINTAINERS SUMMIT] Quality standards for embargoed code
Message-ID: <ZNuuvS5BtmjcazIv@sashalap>
Precedence: bulk
X-Mailing-List: ksummit@lists.linux.dev
List-Id: <ksummit.lists.linux.dev>
List-Subscribe: <mailto:ksummit+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:ksummit+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii; format=flowed
Content-Disposition: inline

Hi folks,

I'd like to have a discussion about how the community handles code drops
to address embargoed security issues: my concern is that we sidestap our
regular development workflow (post patches, review, test, bots, etc...)
that gives us a good quality baseline, and end up taking largely
untested code that causes pain.

In my opinion, there's no benefit in promptly releasing kernels
containing fixes for such issues if these kernels are not usable by
(some) users.

Hardware issues are here to stay, we see an increase in embargoed
security issues, but we're still treating them as one-offs. We should
start to adapt our workflows to these, and a good starting point (IMO)
is assuring/improving the quality of what goes through the pipeline.

Some of the initial thoughts I had around these:

1. Ask (require) organizations that repeatedly go through this mechanism
to create a test environment that can demonstrate how the embargoed code
passes different build/validation tests. We should set a minimal bar to
the demonstrated quality of code that we'll "sneak" behind the backs of
community members.

2. Create a group of trusted "testers" who can test embargoed code with
different (ideally "real") workloads and environments. I think that
we're overly focused on keeping the circle of people in the know small.

3. Work with KernelCI/OpenSSF on setting up a (small) environment
similar to the public one that we could run embargoed code through.

-- 
Thanks,
Sasha

