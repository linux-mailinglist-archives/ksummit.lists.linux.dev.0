Return-Path: <ksummit+bounces-582-lists=lfdr.de@lists.linux.dev>
X-Original-To: lists@lfdr.de
Delivered-To: lists@lfdr.de
Received: from sjc.edge.kernel.org (sjc.edge.kernel.org [IPv6:2604:1380:1000:8100::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 9163F40C9D3
	for <lists@lfdr.de>; Wed, 15 Sep 2021 18:12:36 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sjc.edge.kernel.org (Postfix) with ESMTPS id 385D13E1086
	for <lists@lfdr.de>; Wed, 15 Sep 2021 16:12:35 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id A59873FD8;
	Wed, 15 Sep 2021 16:12:28 +0000 (UTC)
X-Original-To: ksummit@lists.linux.dev
Received: from sipsolutions.net (s3.sipsolutions.net [144.76.43.62])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CA1473FC5
	for <ksummit@lists.linux.dev>; Wed, 15 Sep 2021 16:12:26 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=sipsolutions.net; s=mail; h=Content-Transfer-Encoding:MIME-Version:
	Content-Type:References:In-Reply-To:Date:Cc:To:From:Subject:Message-ID:Sender
	:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:Resent-To:
	Resent-Cc:Resent-Message-ID; bh=5GMpr0nwj9BDuXZAOLebAWNyAgkX4q5XFQCx3cBvq7w=;
	t=1631722346; x=1632931946; b=SSf5bsEwJPdgw5sjcsyNUTlYE2w5ds4MyRcdOXRTTlKydO/
	utgtx6ANr1KkMcjfooRw82LApwKLvrTpLott3NlR7qVgx69a1BEPkOT6R/wD6caKSFf9sE/U4jc+m
	yWpkqQeuoRdyY93ZgwqHg6PtQsnl+m0d8m12YWRtnYc9gzuihK47YQA5DuTGzMv2YW1PPWdFJg2kZ
	bqK8VPGIViNxZxO0tfmn6ZhLx81FmuXP5w34+2hzMUIxzCe0vsye3xOiw8ahBJiVjr/kzCflakUAm
	xUfA8iJjqqC5FrH1HRIs+5WCWQapfOV+zc2BbyhUe/KM+E2o9dicF+BU0A1rDULA==;
Received: by sipsolutions.net with esmtpsa (TLS1.3:ECDHE_SECP256R1__RSA_PSS_RSAE_SHA256__AES_256_GCM:256)
	(Exim 4.95-RC2)
	(envelope-from <johannes@sipsolutions.net>)
	id 1mQXWK-007NTi-2S;
	Wed, 15 Sep 2021 18:12:24 +0200
Message-ID: <86f8da0a8e54f7f6a988182dfb67857f45b13898.camel@sipsolutions.net>
Subject: Re: Reminder: Voting procedures for the Linux Foundation Technical
 Advisory Board
From: Johannes Berg <johannes@sipsolutions.net>
To: Laura Abbott <laura@labbott.name>, Laurent Pinchart
	 <laurent.pinchart@ideasonboard.com>
Cc: ksummit@lists.linux.dev, "linux-kernel@vger.kernel.org"
	 <linux-kernel@vger.kernel.org>, 
	"tech-board-discuss@lists.linuxfoundation.org"
	 <tech-board-discuss@lists.linuxfoundation.org>
Date: Wed, 15 Sep 2021 18:12:23 +0200
In-Reply-To: <1efba77b-965f-62cc-8f80-1e2b0a4f5c2a@labbott.name>
References: <fccbdadc-a57a-f6fe-68d2-0fbac2fd6b81@labbott.name>
	 <b90db9e7-9b6b-c415-d087-3505ba0be0d6@labbott.name>
	 <YUH+DO5aHWGVdNb7@pendragon.ideasonboard.com>
	 <dc45975a-86df-a70d-ff15-58a3bdcf09ee@labbott.name>
	 <6db59b8a4874b60cab7069fd06d180c2601bb427.camel@sipsolutions.net>
	 <1efba77b-965f-62cc-8f80-1e2b0a4f5c2a@labbott.name>
Content-Type: text/plain; charset="UTF-8"
User-Agent: Evolution 3.38.4 (3.38.4-1.fc33) 
Precedence: bulk
X-Mailing-List: ksummit@lists.linux.dev
List-Id: <ksummit.lists.linux.dev>
List-Subscribe: <mailto:ksummit+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:ksummit+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
X-malware-bazaar: not-scanned

On Wed, 2021-09-15 at 12:11 -0400, Laura Abbott wrote:
> 
> You should only request a ballot if you think you have between
> 3-49 commits. I agree this is a bit confusing and this should
> have been worded better and we'll make sure to do better next
> year.

Oh, I think this was clear - but someone might e.g. have 60 commits
spread between multiple email addresses, and not be sure how you
counted, etc.

johannes


