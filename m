Return-Path: <ksummit+bounces-2202-lists=lfdr.de@lists.linux.dev>
X-Original-To: lists@lfdr.de
Delivered-To: lists@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id B3ED5B3117A
	for <lists@lfdr.de>; Fri, 22 Aug 2025 10:18:47 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id BEC8672570C
	for <lists@lfdr.de>; Fri, 22 Aug 2025 08:15:17 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id DD8632EB5DA;
	Fri, 22 Aug 2025 08:14:58 +0000 (UTC)
Received: from lgeamrelo07.lge.com (lgeamrelo07.lge.com [156.147.51.103])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C7CCF286893
	for <ksummit@lists.linux.dev>; Fri, 22 Aug 2025 08:14:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=156.147.51.103
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1755850498; cv=none; b=G5wYS5/XLmnttPBDEp1MBYEZF/LX0/sndhQTTNaOj6E+iU1IPV86yxDGrcmLWQsKt9jgin0/+lsJ4eXJRZRHLXrpifKL64zVSW8t48BajsOjoiCSJTVm7UsgDjJSoYfxR0OHTg+Pp0SsGzbibirxcwJ+1PaLqKJ3BRtLPO62RXk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1755850498; c=relaxed/simple;
	bh=yaowHG58gZ2EXZxhp1Z9v630fFQb6+eQd6H4fhC64hc=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=ktLTOiD1bwee+NQX/2lhkCxF2eeUU5uShIkTAuXB+Vf8Gp/kA/S8SmNuNncmujiGmuhpgPzCDK/l4HvsNleRG2BX+fMQOHG+v5ZvN6VRQSyofNELqKCppmJ+FjGQNmmR5leFOxDGxjA3/VPb2c4AJQZlp49UygQ44scHvQQjhnM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=lge.com; spf=pass smtp.mailfrom=lge.com; arc=none smtp.client-ip=156.147.51.103
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=lge.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=lge.com
Received: from unknown (HELO yjaykim-PowerEdge-T330) (10.177.112.156)
	by 156.147.51.103 with ESMTP; 22 Aug 2025 17:14:51 +0900
X-Original-SENDERIP: 10.177.112.156
X-Original-MAILFROM: youngjun.park@lge.com
Date: Fri, 22 Aug 2025 17:14:51 +0900
From: YoungJun Park <youngjun.park@lge.com>
To: ksummit@lists.linux.dev
Cc: youngjun.park@lge.com, chrisl@kernel.org, gunho.lee@lge.com,
	taejoon.song@lge.com
Subject: [TECH TOPIC] Per-cgroup Swap Device Control
Message-ID: <aKgm+wisMipLqnL4@yjaykim-PowerEdge-T330>
Precedence: bulk
X-Mailing-List: ksummit@lists.linux.dev
List-Id: <ksummit.lists.linux.dev>
List-Subscribe: <mailto:ksummit+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:ksummit+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit

Abstract:
Enabling cgroup-level control over swap devices for diverse workloads

Proposal:
I am developing on a restricted internal platform where there is a
technical requirement to use idle devices as extended memory.

One motivating scenario discussed was to configure background processes
to use slow swap (network) while foreground processes use fast swap
(local storage).

Currently, the kernel does not provide per-process or per-cgroup swap
selection, making this idea unachievable. To meet this usage need, and
after reviewing alternatives, I reached the conclusion that swap
devices must be controllable on a per-cgroup basis.

I would like to present the motivation, implementation progress, and
directions of this work, and invite discussion and feedback from the
community. Through prior exchanges with Chris Li[1], I also recognized
that this topic has already triggered meaningful technical debate, and
I believe a broader discussion at Kernel Summit would be valuable.

Agenda:
1. Motivation for per-cgroup swap priority [2]
   - Comparison with alternative approaches

2. Implementation reviews and problem solving
   - Changes in percpu clusters & swap [3]
   - Consistency with cgroup parent-child semantics [4]
   - Challenges with NUMA autobind and swap priority [5]

3. Criticism and alternative ideas
   - Technical concerns raised by Chris Li [6]
   - Introduction of the swap tier approach

4. Further discussion
   - Topics expected to arise in ongoing reviews before Plumbers

These agenda items reflect issues that have emerged through the ongoing
RFC → PATCH development process. The presentation aims to summarize
these discussions, share the current direction, and invite further
feedback and open discussion from the community.

[1] https://lore.kernel.org/linux-mm/CAF8kJuMo3yNKOZL9n5UkHx_O5cTZts287HOnQOu=KqQcnbrMdg@mail.gmail.com/
[2] https://lore.kernel.org/linux-mm/20250612103743.3385842-1-youngjun.park@lge.com/
[3] https://lore.kernel.org/linux-mm/CAMgjq7BJE9ALFG4N8wb-hdkC+b-8d1+ckXL9D6pbbfgiXfuzPA@mail.gmail.com/
[4] https://lore.kernel.org/linux-mm/rivwhhhkuqy7p4r6mmuhpheaj3c7vcw4w4kavp42avpz7es5vp@hbnvrmgzb5tr/
[5] https://lore.kernel.org/linux-mm/jrkh2jy2pkoxgsxgsstpmijyhbzzyige6ubltvmvwl6fwkp3s7@kzc24pj2tcko/
[6] https://lore.kernel.org/linux-mm/CAF8kJuMo3yNKOZL9n5UkHx_O5cTZts287HOnQOu=KqQcnbrMdg@mail.gmail.com/

