Return-Path: <ksummit+bounces-1230-lists=lfdr.de@lists.linux.dev>
X-Original-To: lists@lfdr.de
Delivered-To: lists@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 8B55B906670
	for <lists@lfdr.de>; Thu, 13 Jun 2024 10:22:44 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 0B92F1F25702
	for <lists@lfdr.de>; Thu, 13 Jun 2024 08:22:44 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id B91B313D507;
	Thu, 13 Jun 2024 08:22:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=leemhuis.info header.i=@leemhuis.info header.b="Tz0pziZm"
Received: from wp530.webpack.hosteurope.de (wp530.webpack.hosteurope.de [80.237.130.52])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1DFA113CFB6
	for <ksummit@lists.linux.dev>; Thu, 13 Jun 2024 08:22:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=80.237.130.52
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1718266957; cv=none; b=UVZii1VHQbiStTdgzNxhM3pAs5jh13e0XfJecNpm2rD3r5ZGYylfnz3jKoFJhhtJgYyM0/OmPthmg2aGpLizHkr0EaZN1zk1fHLZzTe/sAsXIPLnjsZ7JS53PXJs58w6o9KGLckF8swhOgKZKxIaBQX4NF31VGKX6o0BaAdykjs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1718266957; c=relaxed/simple;
	bh=vVoGgpZGlGD4Fram44RoQXlNRo7v0C2kMTMYo2BW+fA=;
	h=Message-ID:Date:MIME-Version:From:To:Subject:Content-Type; b=i3F94MgM+MTGQvtJdPwjGHBsx6CHlY505pBbKvwLebya984U5BAl2J9d3qnR3d2I/Exbgn9ldNdYW/AblKkbWQgYCGoqNuTTTYMUji5BwqtL8aqZDgtUaA4pJE9kXjvYpkKPyR0XnAG8rtwkUqHBvT+1BUXfC7lIEt6d/+MzxXQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=leemhuis.info; spf=pass smtp.mailfrom=leemhuis.info; dkim=pass (2048-bit key) header.d=leemhuis.info header.i=@leemhuis.info header.b=Tz0pziZm; arc=none smtp.client-ip=80.237.130.52
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=leemhuis.info
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=leemhuis.info
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=leemhuis.info; s=he214686; h=Content-Transfer-Encoding:Content-Type:Subject
	:To:From:MIME-Version:Date:Message-ID:From:Sender:Reply-To:Subject:Date:
	Message-ID:To:Cc:MIME-Version:Content-Type:Content-Transfer-Encoding:
	Content-ID:Content-Description:In-Reply-To:References;
	bh=5a8q6WABoIix+LuiA5Xzua6SeHpFhoyQldfuJ8sRmXc=; t=1718266955; x=1718698955;
	 b=Tz0pziZmk+kdD50lX3D2Laad13hDT7GgTMrU0Yut0Ye6zuCF6sovk/o6yci5ZKJCBaSu2TWkFf
	z9Shcl6U7nSN2ghF9MYYtpvB46T6uvL33Qk/91EMP+m5NwFOVLzxl72nwZb7wm6jGPghflvoGawYc
	VNZCgeyWkQzE8NMEGsNlC8rQzHdmWPNgwcK+1vhxPgkviRwXKpIH/Mz0ZSYtx0xY2U4aClRRa4aNz
	f93BOXBaZl2ajqRZfHrqkLjkPN7YM5oCcmGWco4oNDeelxuOxqPcHnl+ppt/2LHvo0tJ7I0pO9JxO
	wMQcTyKp+mMwv4+kvSWbmOK/Kz6WBT045Cn1w==;
Received: from [2a02:8108:8980:2478:8cde:aa2c:f324:937e]; authenticated
	by wp530.webpack.hosteurope.de running ExIM with esmtpsa (TLS1.3:ECDHE_RSA_AES_128_GCM_SHA256:128)
	id 1sHfj7-0001wr-5P; Thu, 13 Jun 2024 10:22:33 +0200
Message-ID: <c6be1b86-f224-417c-a501-6c778999a04f@leemhuis.info>
Date: Thu, 13 Jun 2024 10:22:32 +0200
Precedence: bulk
X-Mailing-List: ksummit@lists.linux.dev
List-Id: <ksummit.lists.linux.dev>
List-Subscribe: <mailto:ksummit+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:ksummit+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
From: Thorsten Leemhuis <linux@leemhuis.info>
Content-Language: en-US, de-DE
To: "ksummit@lists.linux.dev" <ksummit@lists.linux.dev>
Subject: [MAINTAINERS SUMMIT] [0/4] Common scenario for four proposals
 regarding regressions
Autocrypt: addr=linux@leemhuis.info; keydata=
 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 n7RI
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-bounce-key: webpack.hosteurope.de;linux@leemhuis.info;1718266955;97be7d01;
X-HE-SMSGID: 1sHfj7-0001wr-5P

Lo! I prepared four proposals for the maintainers summit regarding
regressions I'll send in reply to this mail. They are somewhat related
and address different aspects of one scenario I see frequently in
different variations; so instead of repeating that scenario in slightly
modified form in each of the proposals, I'm putting it out here once:

---

A change makes it into mainline (case "a") right before a release (say
of 6.7) or (case "b") shortly after (e.g. during a merge window of 6.8).
That change then within a few days might even be backported to the
latest stable releases (case "c") deemed for end users (say 6.6.13 or
[in case "b"] to 6.7.3). Only then it becomes known that the change
causes a regression (e.g. in both mainline and the stable trees).

Once reported, the problem then is quickly debugged and within two or
three days a tested fix ready for review emerges[1]. But then that fix
only makes it to a new mainline -rc after more than two, three, or many
more weeks due to one or a combination of the following factors:

* Review takes a long time, as nobody feels urged to take a closer look
soon[2].

* Maintainers take quite some time to commit the fix to their subsystem
tree[2].

* Maintainers take quite some time to submit another PR to Linus or only
send the fix shortly before[2, 3] or after[4] the next proper mainline
release (e.g. 6.8).

A few days later the stable team then backports the fix (for case "a"
and "c" -- or "b", if the fix was only merged in the following merge
window) and after a stable-rc phase fixes the problem in their trees as
well[5] -- which takes at least three days, usually close to about one
week, and if the timing is bad easily 10 days or longer.

Despite an available fix, users of mainline then in the end were exposed
to the regression for many weeks[6] -- often more than 1 month, but I've
seen 2+ months quite a few times, too (e.g. when the culprit was merged
shortly before the 6.7 release and the fix only in the merge window for
6.9).

For users of stable trees it is often about as long or a little bit
longer depending on how well the mainline merge of the fix aligns with
the release of the next stable-rc[7]; that's because the stable team is
not allowed[8] or usually won't[9] do anything to resolve regressions
that also happen in mainline before a fix is mainlined.

[1] That's obviously not always the case, but surprisingly often, which
    is great; thx for that!
[2] Because they are simply not aware that the patch fixes a regression
    that bothers users or due to stances like "the next mainline release
    is still weeks away".
[3] For example due to stances like "because I did not want to send
    Linus a PR with just one fix"; I recently even had a case of "the
    -next rules forbids to commit new changes during the merge window"
    (which is not true when it comes to fixes) that delayed things.
[4] Disclaimer: for fixes that bear big risks or fixes for regressions
    introduced more than a year ago waiting can be the right thing.
[5] Assuming the stable team notices that it's fixing a regression in
    their trees.
[6] Which can discourage or hinder testers and CIs from testing and mean
    that they miss other bugs affecting the same platform. IOW: even in
    a simplified case of this scenario where the fix was not backported
    to stable trees this would be a problem for some folks that could
    easily be avoided by merging the fix faster.
[7] Until the issue is fixed, users thus have four options: (1) live
    with the regression, which might be impossible if it breaks
    something crucial like booting; (2) switch back to the
    second-to-last stable series, which often will be EOL and thus prone
    to vulnerabilities; (3) switch to a older longterm kernel series,
    which might be impossible due to missing drivers or because the
    culprit was backported there, too; (4) switch to a unstable kernel
    (e.g. mainline) once the issue is fixed there, which they might be
    afraid to do or if unlucky contains another regression that causes
    trouble.
[8] Our rules forbid the stable maintainer to revert a mainline commit
    or accept a fix for it before an equivalent revert or fix is
     mainlined.
[9] The stable team could temporarily revert a backport of a mainline
    commit that is causing a regression in both mainline and stable
    which they later could reapply once a fix for it was mainlined --
    but it almost never does that. Which I can understand, as that would
    complicate things and might be unwise, as the commit might fix some
    security issue; this approach also might be the right strategy in
    general to ensure mainline is fixed quickly as well[6].

---

Ciao, Thorsten

