Return-Path: <ksummit+bounces-2175-lists=lfdr.de@lists.linux.dev>
X-Original-To: lists@lfdr.de
Delivered-To: lists@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 52750B3002A
	for <lists@lfdr.de>; Thu, 21 Aug 2025 18:35:56 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 758D51CE0F4A
	for <lists@lfdr.de>; Thu, 21 Aug 2025 16:28:21 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id ADCAD2DD5E0;
	Thu, 21 Aug 2025 16:27:57 +0000 (UTC)
Received: from relay.hostedemail.com (smtprelay0012.hostedemail.com [216.40.44.12])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D11FB2DE70D
	for <ksummit@lists.linux.dev>; Thu, 21 Aug 2025 16:27:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=216.40.44.12
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1755793677; cv=none; b=UnzHqIujr0oXGjVlG4BqAk+wO5i59wNG23nnh1nzOqzH1oYRLUeOSbpXeHlHhcTsAgGQgFOP9onp/AyGN6tiWl6U8KUXmCBK0zGwuFFwbUv6WvfKPm9bk6svyhf0z7Dknh9uTKdU8e0mZrwi2rbaZa/OgMsWe/fBf9JNGsgsXT4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1755793677; c=relaxed/simple;
	bh=bxMXYy+zXhd8IdvDf4l1l2BfrFDUaWsDErHagNPkAu8=;
	h=Date:From:To:Cc:Subject:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=muzF3txAekCPRzsLVhDm+0JFA9kEvx55v2/5YAuvuFujqdpSCkXvQuSMv5TtMRRvQAY9XoZ0cozoZ3inwtkkh0uPY8eN26lElA/qESDcEU4sPsniZUs1t565zN1ztFSXcQb9yTCRXdcVaIGXH/e2u/HlJBmBN67KNHEb+32YSX0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=goodmis.org; spf=pass smtp.mailfrom=goodmis.org; arc=none smtp.client-ip=216.40.44.12
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=goodmis.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=goodmis.org
Received: from omf17.hostedemail.com (a10.router.float.18 [10.200.18.1])
	by unirelay09.hostedemail.com (Postfix) with ESMTP id E4F1B83682;
	Thu, 21 Aug 2025 16:27:47 +0000 (UTC)
Received: from [HIDDEN] (Authenticated sender: rostedt@goodmis.org) by omf17.hostedemail.com (Postfix) with ESMTPA id 4CEFA17;
	Thu, 21 Aug 2025 16:27:46 +0000 (UTC)
Date: Thu, 21 Aug 2025 12:27:50 -0400
From: Steven Rostedt <rostedt@goodmis.org>
To: James Bottomley <James.Bottomley@HansenPartnership.com>
Cc: ksummit@lists.linux.dev, linux-fsdevel@vger.kernel.org
Subject: Re: [MAINTAINER SUMMIT] Adding more formality around feature
 inclusion and ejection
Message-ID: <20250821122750.66a2b101@gandalf.local.home>
In-Reply-To: <fc0994de40776609928e8e438355a24a54f1ad10.camel@HansenPartnership.com>
References: <fc0994de40776609928e8e438355a24a54f1ad10.camel@HansenPartnership.com>
X-Mailer: Claws Mail 3.20.0git84 (GTK+ 2.24.33; x86_64-pc-linux-gnu)
Precedence: bulk
X-Mailing-List: ksummit@lists.linux.dev
List-Id: <ksummit.lists.linux.dev>
List-Subscribe: <mailto:ksummit+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:ksummit+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
X-Rspamd-Server: rspamout04
X-Rspamd-Queue-Id: 4CEFA17
X-Stat-Signature: 7dmpeqz9peocjqmn1f6jrcx4uc8ssp7e
X-Session-Marker: 726F737465647440676F6F646D69732E6F7267
X-Session-ID: U2FsdGVkX1/mxB/npHbdufTge3T3jVDA+GAOZ8p7IEk=
X-HE-Tag: 1755793666-164900
X-HE-Meta: U2FsdGVkX19vdMypWTZ+cu7jHudpAlel61kV0fW9B/td3BmXi6urpbqeTBLgyTzQkmegFOCBODcATQI7pWGDK1ujOop++8skVD1S7QPrXUK9apEJdjGIXa4Xwj6pT4QWlDfsN3xvhN9S3c2jxjWV8xI6lAdhYz3ZUAQQ54znYDkB1CYG87vbAmKnYwYtpzRe5S62bYlOml1SUWVu17UyPv64LuoJWfBheM5LchJlDEkmqiThhFK59sRMRW4AJJtUr/nBGJLmcxKFSdQmoW8mqm4W66v1W89UohIOtX7aZL8VhABedv2B5YiGujzvhbBaDk9elb64u5Nc6zWXEuaduh6IaXlFodfPtXAsZ9dBPO4rmzFnWwn8HTrTigomYIWN

On Thu, 21 Aug 2025 09:56:15 +0100
James Bottomley <James.Bottomley@HansenPartnership.com> wrote:

What exactly do you mean by "feature inclusion"?

Something that requires a new maintainer? As with the bcachefs, the issue
was with how the new maintainer worked with the current workflow.

Maybe you mean "maintainer inclusion and ejection"?

> However, I'm sure others will have different ideas.

The thing is, I believe there's a lot of features and maintainers that are
added. Most go unnoticed as the feature is a niche (much like bcachefs was).

Perhaps we should have a maintainer mentorship program. I try to work with
others to help them become a new maintainer. I was doing that with Daniel
Bristot, and I've done it for Masami Hiramatsu and I'm currently helping
others to become maintainers for the trace and verification tooling.

I share my scripts and explain how to do a pull request. How to use
linux-next and what to and more importantly, what not to send during during
the -rc releases.

I'm sure others have helped developers become maintainers as well. Perhaps
we should get together and come up with a formal way to become a maintainer?
Because honestly, it's currently done by trial and error. I think that
should change.

-- Steve

