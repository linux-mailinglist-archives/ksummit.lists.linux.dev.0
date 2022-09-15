Return-Path: <ksummit+bounces-772-lists=lfdr.de@lists.linux.dev>
X-Original-To: lists@lfdr.de
Delivered-To: lists@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 45D5D5B95A4
	for <lists@lfdr.de>; Thu, 15 Sep 2022 09:45:09 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 3848B1C20920
	for <lists@lfdr.de>; Thu, 15 Sep 2022 07:45:08 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 3BAAE28F1;
	Thu, 15 Sep 2022 07:45:01 +0000 (UTC)
X-Original-To: ksummit@lists.linux.dev
Received: from ms.lwn.net (ms.lwn.net [45.79.88.28])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 853817F
	for <ksummit@lists.linux.dev>; Thu, 15 Sep 2022 07:44:59 +0000 (UTC)
Received: from localhost (unknown [185.122.133.20])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ms.lwn.net (Postfix) with ESMTPSA id 0597477D;
	Thu, 15 Sep 2022 07:44:51 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 ms.lwn.net 0597477D
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=lwn.net; s=20201203;
	t=1663227892; bh=cRUlwF+s0iJ7JuhPvZh6GgbN8BxpSN3iwOamz7holVk=;
	h=From:To:Cc:Subject:Date:From;
	b=LnCRZcuRboCJy88Js1WALxuTtdXpvkfPqHQUk1H1MMlC39l3k/3M9BoEZMZCFpFFM
	 tFXLBnF3ZG0TE+doFD0+VAAmgPw/MbgK0Dvj51+fOdukwPmOddWxnHJl8UKz4otr4I
	 X8NzoeZR60PF/f3kr9S9gdl7DE1H4q/qQqiqbZPfI8GhJKc2x/nneLmMwTxxl8wf2Q
	 U7B/Vi1rbyiHo0zbPFqSfPIqPxWwIviFGsBmjxjNqMcb3KT5qDgGoMMdWChQDqk/l0
	 TEdPM+ImpMLIB2bm/0s1fiZ+5jjO/q/jl7G4OX7JyuQ7LYnQPfPVfbJy5dTPp6MRqn
	 7B9vtgco71U3w==
From: Jonathan Corbet <corbet@lwn.net>
To: linux-kernel@vger.kernel.org, ksummit@lists.linux.dev
Cc: tab-elections@lists.linuxfoundation.org,
 tech-board@lists.linuxfoundation.org
Subject: Results from the 2022 LF TAB election
Date: Thu, 15 Sep 2022 01:44:49 -0600
Message-ID: <87h71984jy.fsf@meer.lwn.net>
Precedence: bulk
X-Mailing-List: ksummit@lists.linux.dev
List-Id: <ksummit.lists.linux.dev>
List-Subscribe: <mailto:ksummit+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:ksummit+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain

There were 960 eligible voters for the 2022 Linux Foundation Technical
Advisory Board election, of whom 267 cast ballots.  The results were:

1. Kees Cook
2. Christian Brauner
3. Jakub Kicinski
4. Dan Williams
5. Dave Hansen
---
6. Chris Mason
7. KP Singh

The top five candidates will serve two-year terms on the TAB.  Thanks to
all who participated in this years election; please reach out to
tab-elections@lists.linuxfoundation.org if you have any questions.

jon

P.S. On a personal note: a special "thank you" to Chris Mason, who has
     led the TAB well for many years.


