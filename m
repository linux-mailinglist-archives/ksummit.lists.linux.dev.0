Return-Path: <ksummit+bounces-1394-lists=lfdr.de@lists.linux.dev>
X-Original-To: lists@lfdr.de
Delivered-To: lists@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [147.75.48.161])
	by mail.lfdr.de (Postfix) with ESMTPS id 052579309ED
	for <lists@lfdr.de>; Sun, 14 Jul 2024 14:31:47 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 89D67B2106A
	for <lists@lfdr.de>; Sun, 14 Jul 2024 12:31:45 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id A9154745E2;
	Sun, 14 Jul 2024 12:31:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="unGACnT3"
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 30C936FE07
	for <ksummit@lists.linux.dev>; Sun, 14 Jul 2024 12:31:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1720960295; cv=none; b=fx3cLsWZ3fvmOLQuG4GM0nX1xGwanA0bVENWMHV466zsWEZbG5+zUGNKHW1YELZm5sm3l+hgTgmrwLrLvulrYp2wk8zg32BwXeYen9DupPPv+ZCwTKUPK6CdQskljl520QOjvz8c3ZO7Zm/97WuaU55qWC/QYcipYlmv5JkShhg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1720960295; c=relaxed/simple;
	bh=eFs7c9suLHknEBwUCTOWPP1zooe4Y1sytBABouaeKA4=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=Zy64YfDsqh+iInd1IqyB+ZunCpWxfeUyA29kRHAQ3Kyp5uel3VPOBUk6Xxr5gQ3dfwnVJZIFTIlM1Ax8EZnps90Ohdpc7/qRt8PEAqP8IgxnLDDTezFclA5HER0nH6PyxBrHxdsoRdwCGtMpaWMIj8arTCn8LOx4ZgAsjANIkEU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=unGACnT3; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 7E630C116B1;
	Sun, 14 Jul 2024 12:31:34 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1720960294;
	bh=eFs7c9suLHknEBwUCTOWPP1zooe4Y1sytBABouaeKA4=;
	h=Date:From:To:Cc:Subject:From;
	b=unGACnT3MUlL9HEWUuUeFlEv3iWeYEdE9gSZAzWiE2tmSd0ja1/CHz8ucHqQuPwbt
	 1tlwEKq/+eQfIEO8Tf076J0ibcfpUFZlQuWpR8xw7nW0mKHOvlwalTXvpUbC78GfWY
	 4UtusOxF1Pw31YxWCUxUUm2L/ebpEVriSi1zc0WGyfmcG+N2m3bnHlNySxEFX617Cw
	 CwLwl6UjEDlj1BS/WJnGEXARqG/vvE+S1ioQWzaf01svPAmOVnQyYppbyAt48re8rk
	 y2001vAJYS2Tdi21vexzeJW+2jZPF3XmqCTXvLwYOjSzZG1dsdVacYPd1hxkoVr0OS
	 pK/pqkn7IEnNQ==
Date: Sun, 14 Jul 2024 08:31:32 -0400
From: Sasha Levin <sashal@kernel.org>
To: ksummit@lists.linux.dev
Cc: Greg KH <gregkh@linuxfoundation.org>
Subject: Proposal: Enhancing Commit Tagging for Stable Kernel Branches
Message-ID: <ZpPFJH2uDLzIhBoB@sashalap>
Precedence: bulk
X-Mailing-List: ksummit@lists.linux.dev
List-Id: <ksummit.lists.linux.dev>
List-Subscribe: <mailto:ksummit+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:ksummit+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii; format=flowed
Content-Disposition: inline

Hi folks,

The Linux kernel community relies heavily on commit tags to identify and
manage patches destined for stable kernel branches. Currently, we use a
"Stable tag" (cc: stable@kernel.org) to indicate that a patch should be
included in stable kernel branches, and a "Fixes tag" (Fixes:
012345678901 ("commit subject")) to point to an older commit that the
new commit fixes or improves. However, this scheme has led to some
unintended consequences.

One of the main issues is that most Fixes-tagged commits (>80%) end up
in a stable tree, leading some authors to omit the Stable tag
altogether. This means we may not be trying hard enough to include
critical commits in stable kernel branches. On the other hand, some
authors are unhappy when commits without a Stable tag end up in a stable
kernel branch. To address these shortcomings, I propose introducing an
"Improves tag" (Improves: 012345678901 ("commit subject")) and altering
the meaning of the Fixes tag.

The Improves tag would indicate that a commit improves something but
does not necessarily fix an issue. This new tag would imply that the
commit should not be included in a stable kernel branch, unless it's
needed as a dependency for a later commit. In contrast, the Fixes tag
would henceforth carry the same meaning as if the Stable tag were
present, ensuring that critical fixes are properly identified and
prioritized.

By introducing the Improves tag and updating the semantics of the Fixes
tag, we can provide authors with more nuanced options for describing
their commits. This change would also allow us to slowly deprecate the
Stable tag, making it easier on authors by having one less tag to add.
The recently introduced "not for stable tag" (Cc:
<stable+noautosel@kernel.org>) could still be used in cases where an
author explicitly wants to exclude their commit from a stable kernel
branch.

I believe this proposal would improve the overall quality and
consistency of our commit tagging scheme, making it easier for authors
to provide accurate metadata about their commits. This, in turn, would
facilitate more efficient management of patches destined for stable
kernel branches. I invite feedback and discussion from the Linux kernel
community on this proposal.

-- 
Thanks,
Sasha

