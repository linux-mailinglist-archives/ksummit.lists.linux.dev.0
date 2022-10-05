Return-Path: <ksummit+bounces-931-lists=lfdr.de@lists.linux.dev>
X-Original-To: lists@lfdr.de
Delivered-To: lists@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 166AC5F5430
	for <lists@lfdr.de>; Wed,  5 Oct 2022 14:07:32 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 43E1E280BEA
	for <lists@lfdr.de>; Wed,  5 Oct 2022 12:07:30 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id DC134138E;
	Wed,  5 Oct 2022 12:07:23 +0000 (UTC)
X-Original-To: ksummit@lists.linux.dev
Received: from delivery29.mailspamprotection.com (delivery29.mailspamprotection.com [185.56.84.32])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F16CF136B
	for <ksummit@lists.linux.dev>; Wed,  5 Oct 2022 12:07:21 +0000 (UTC)
Received: from 10.99.208.35.bc.googleusercontent.com ([35.208.99.10] helo=us256.siteground.us)
	by se29.mailspamprotection.com with esmtps (TLSv1.2:AES128-GCM-SHA256:128)
	(Exim 4.92)
	id 1ofxGu-0006H6-92
	for ksummit@lists.linux.dev; Wed, 05 Oct 2022 00:48:45 -0500
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=us256.siteground.us; s=default; h=Date:Subject:To:From:cc:list-help:
	list-unsubscribe:list-subscribe:list-post:list-owner:list-archive;
	bh=Z9wTC1VuunX+C6O4hDseTsA8zlsqGkBg6rGVRWmAscE=; b=Ynui14vSoM8FhC7JEwtLJOruL/
	8MT/K2yl0d+I7/HPFIEHydmpZKvSW+Iocvyuw05px2vGUi+9E6nOh4bTi/FyOX7IGnGvz2z7oTd05
	lw0BlWnfUumjMEO8jpvrOOyJZYR772jWQPdCXbtm6FeKa7NVhSf/6xp0tJun/d/aoqQQ=;
Received: from mailnull by us256.siteground.us with local (Exim 4.96)
	id 1ofxGm-000Fek-1l
	for ksummit@lists.linux.dev;
	Wed, 05 Oct 2022 05:48:36 +0000
X-Failed-Recipients: kevin@salonbasinger.com
Auto-Submitted: auto-replied
From: Mail Delivery System <Mailer-Daemon@us256.siteground.us>
To: ksummit@lists.linux.dev
References: <48c97496-983b-4227-9566-2223268b51bf@lists.linux.dev>
Content-Type: multipart/report; report-type=delivery-status; boundary=1664948916-eximdsn-1789472636
Precedence: bulk
X-Mailing-List: ksummit@lists.linux.dev
List-Id: <ksummit.lists.linux.dev>
List-Subscribe: <mailto:ksummit+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:ksummit+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Subject: Mail delivery failed: returning message to sender
Message-Id: <E1ofxGm-000Fek-1l@us256.siteground.us>
Date: Wed, 05 Oct 2022 05:48:36 +0000
X-Originating-IP: 35.208.99.10
X-SpamExperts-Domain: us256.siteground.us
X-SpamExperts-Username: 35.208.99.10
Authentication-Results: mailspamprotection.com; auth=pass smtp.auth=35.208.99.10@us256.siteground.us
X-SpamExperts-Outgoing-Class: unsure
X-SpamExperts-Outgoing-Evidence: Combined (0.33)
X-Recommended-Action: accept
X-Filter-ID: Pt3MvcO5N4iKaDQ5O6lkdGlMVN6RH8bjRMzItlySaT8FvORZ0jQqtN/PO4hhQvY1PUtbdvnXkggZ
 3YnVId/Y5jcf0yeVQAvfjHznO7+bT5xu/SC+qem84WGG4sPRiwAH81AJ1TFUyPPWZD/fbWINKOfH
 zJ6mVE7ewsipSVIfs4aMtd7tTOsXkXWm71TPTSf0ABHVTw1lV42ob3hDgXVUNcuMbjamI4+rz6E2
 TdubE9Zd+Emcsq64gCNq47XpAhL3cYV33faV/P5H/To7cjLhqZ5GmkAVmEBl4IAc4hr7OQ+ceXZN
 G0EUbELA0uv9YhdOARsynxDH0D+SLDJWdESXzt3HlBLXAa0Td3DmRHXED0/mRtX1Hfs7Fb9Ao09H
 OUrSbsR08q9tEAjFm2byf+NztGDvwHtYdYSxhouHm79/O4W9USdBm5ThV8YJRTnQ9tGtVf1qzaRU
 c3P3olRHLamMQyb0mbZGjIHswS91OoTWbV1pLRUYE+jf+CRz1mRmvg+3ejx+ZEH83D3uT7G9vVxS
 oIOZ/FQYqPJulBW8G2/zLcvJvFCbAD7w3FUirQwmJIqD2OUMeHyTpNN0eXybX/w7/3ZCM0u5uBlK
 VwmNWN494pXjnzJ0E7sUbsO29yv2kW+YJEp91epRpOyOlAfEEMzV5UlbXBNx0O9Ko+sXNqyBsR7N
 v6gvRG8Egtsm7Ue22/SBqfTWWasexoc4PN6mlJ+taoDOcg83LXH4GksgCfTIQ56BYMnJCEa9PzH7
 xmvIXqwZuKUsHfvATIW9SGz+oZBiGAYbOCavEkmyxfJREEQggNgnxhOOC+j2bgQxjyTonusuYE8Y
 6tTvmHqq1lZ5ceJjqjRgQDsjWEQj+NQ6d8TwUwY8CVsONrMJuGzuoGnKTKcyizE3RDE4Pahq3GMA
 M0J/vTIDpQr/7bydedH7NBRKwrV+9PpSi3mSkjIGAux8ed3jLQ3vHTwz8GATFsXv1xu/dd40eTXl
 WiUAYdLmsJdAoPIkaBAbUp9codeF+6ujzOdLvbI61upiR7NZxRlKwEUw0AsUlJr1MBGjleO80AM/
 0JtEZn0eXdrnKqSsHZZAd8nzCl4yqVpTitwYskHwtvWeuw==
X-Report-Abuse-To: spam@quarantine1.mailspamprotection.com

--1664948916-eximdsn-1789472636
Content-type: text/plain; charset=us-ascii

This message was created automatically by mail delivery software.

A message that you sent could not be delivered to one or more of its
recipients. This is a permanent error. The following address(es) failed:

  kevin@salonbasinger.com
    No Such User Here

--1664948916-eximdsn-1789472636
Content-type: message/delivery-status

Reporting-MTA: dns; us256.siteground.us

Action: failed
Final-Recipient: rfc822;kevin@salonbasinger.com
Status: 5.0.0

--1664948916-eximdsn-1789472636
Content-type: text/rfc822-headers

Return-path: <ksummit@lists.linux.dev>
Received: from [113.133.226.15] (port=59646 helo=lists.linux.dev)
	by us256.siteground.us with esmtp (Exim 4.96)
	(envelope-from <ksummit@lists.linux.dev>)
	id 1ofxEn-000EK3-11
	for kevin@salonbasinger.com;
	Wed, 05 Oct 2022 05:48:36 +0000
User-Agent: Mozilla/5.0 (Windows NT 6.1; WOW64; rv:68.0) Gecko/20100101 Thunderbird/68.2.2
From: "5A07B0e" <ksummit@lists.linux.dev>
Subject: 001408175866
To: "kevin" <kevin@salonbasinger.com>
Content-Type: multipart/mixed; charset=GB2312; boundary="------------84392CCBAC08B926331F3F4C"
MIME-Version: 1.0
Reply-To: gjkk1234@21cn.com
Date: Wed, 5 Oct 2022 13:46:35 +0800
Message-Id: <48c97496-983b-4227-9566-2223268b51bf@lists.linux.dev>
X-Mailer: Thunderbird/68.2.2
X-Exim-DSN-Information: Due to administrative limits only headers are returned


--1664948916-eximdsn-1789472636--

